using ADNLPModels, JuMP, Ipopt, NLPModelsIpopt, CTBase
using CTBase:Model
using Profile

#include("solve_jump.jl")
#include("solve_mathopt.jl")
#include("solve_adnlp.jl")

#=
#JuMP model, Ipopt solver
sys = JuMP.Model(optimizer_with_attributes(Ipopt.Optimizer,"print_level"=> 5))
set_optimizer_attribute(sys,"tol",1e-8)
set_optimizer_attribute(sys,"constr_viol_tol",1e-6)
set_optimizer_attribute(sys,"max_iter",1000)

n=2
m=1
t0=0
x0=[-1, 0]
xf=[0, 0]
γ = 1
N = 30

JuMP.@variables(sys, begin
    0.0 ≤ Δt
    -γ ≤ u[1:N+1] ≤ γ
    x₁[1:N+1]
    x₂[1:N+1]
end)

set_start_value(Δt, 0.1/30)
set_start_value(x₁[1], 0.1)
set_start_value(x₂[1], 0.1)

@objective(sys, Min, Δt)

JuMP.@constraints(sys, begin
    con_x₁0, x₁[1] == x0[1]
    con_x₂0, x₂[1] == x0[2]
    con_x₁f, x₁[N+1] == xf[1]
    con_x₂f, x₂[N+1] == xf[2]
end)

JuMP.@NLexpressions(sys, begin
    # x₁' = x₂
    dx₁[i = 1:N+1], x₂[i]
    # x₂' = u
    dx₂[i = 1:N+1], u[i]
end)

JuMP.@NLconstraints(sys, begin
    con_dx₁[i = 1:N], x₁[i+1] == x₁[i] + Δt * (dx₁[i] + dx₁[i+1])/2.0
    con_dx₂[i = 1:N], x₂[i+1] == x₂[i] + Δt * (dx₂[i] + dx₂[i+1])/2.0
end);


OptimalControlInit([0.1,0.1,0.1],0.1,0.1)
=#

# f(x) = (x[1] - 1.0)^2 + 100*(x[2] - x[1]^2)^2
# x0 = [-1.2; 1.0]
# lvar = [-Inf; 0.1]
# uvar = [0.5; 0.5]
# c(x) = [x[1] + x[2] - 2; x[1]^2 + x[2]^2]
# lcon = [0.0; -Inf]
# ucon = [Inf; 1.0]
# nlp = ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon)

# println("cx = $(cons(nlp, nlp.meta.x0))")
# println("Jx = $(jac(nlp, nlp.meta.x0))")


# ctd = CTDirect_data(ocp, grid_size, init)
# xu0 = initial_guess(ctd)
# l_var, u_var = variables_bounds(ctd)
# lb, ub = constraints_bounds(ctd)
# #nlp = ADNLPModel(xu -> ipopt_objective(xu, ctd), xu0, l_var, u_var, get_ipopt_constraint(ctd), lb, ub)
# nlp = ADNLPModel(xu -> ipopt_objective(xu, ctd), xu0, l_var, u_var, xu -> ipopt_constraint(xu,ctd), lb, ub)
N = 30
obj_fun(xuv) = xuv[end] # objectiv
dim_v = (N+1)*(2+1) + 1 # dimension of vector xu+v
xuv0 = fill(0.1,dim_v)
l_var = -Inf*ones(dim_v)
u_var = Inf*ones(dim_v)
for i ∈ 1:dim_v # variable bounds
    if i == dim_v
        l_var[i] = 0
        u_var[i] = Inf
    elseif i > (N+1)*2
        l_var[i] = -γ
        u_var[i] = γ
    end
end
l_var[1:2] = x0
u_var[1:2] = x0
l_var[(N+1)*2-1:(N+1)*2] = xf
u_var[(N+1)*2-1:(N+1)*2] = xf
#l_var[end] = 0
#u_var[end] = Inf
lb = zeros((N+1)*2)
ub = zeros((N+1)*2)
lb[1:2] = x0
lb[(N+1)*2-1:(N+1)*2] = xf
ub[1:2] = x0
ub[(N+1)*2-1:(N+1)*2] = xf
#dyn(x,u) = [x[2],u]
function con_fun(xuv) 
    h = (xuv[end]-t0)/N
    c = zeros(eltype(xuv),2*(N+1))
    xi = xuv[1:2] # state at time 0
    ui = xuv[2*(N+1)+1] # control at time 0
    #fi = [xi[2],ui] #dyn(xi,ui) # dynamic at time 0
    index = 1
    for i ∈ 0:N-1   
        xip1 = xuv[((i+1)*2+1):((i+1)*2+2)] # state at time i+1
        uip1 = xuv[2*(N+1)+(i+1)+1] # control at time i+1
        # fip1 = [xip1[2],uip1] #dyn(xip1,uip1) # dynamic at time i+1
        # c[index] = xip1[1] - (xi[1] + 0.5*h*(fi[1] + fip1[1]))
        # c[index+1] = xip1[2] - (xi[2] + 0.5*h*(fi[2] + fip1[2]))
        c[index] = xip1[1] - (xi[1] + 0.5*h*(xi[2] + xip1[2]))
        c[index+1] = xip1[2] - (xi[2] + 0.5*h*(ui + uip1))
        index = index + 2
        xi = xip1
        ui = uip1
        #fi = fip1
    end
    return(c)
end 
adnlp = ADNLPModel(obj_fun,xuv0,l_var,u_var,con_fun,lb,ub)
solver = IpoptSolver(adnlp)
@time ipopt_solution = NLPModelsIpopt.solve!(solver,adnlp,print_level=5)
println(ipopt_solution.solution[end])

# println("\nJUMP resolution\n")
# @time jump_solve(sys)
# println("\nJUMP -> MathOptNLPModel NLPModelsIpopt resolution\n")
# @time mathopt_solve(sys)
# println("\nCTDirect OCPModel -> ADNLPModel NLPModelsIpopt resolution\n")
# # Profile.init(10000000,0.0001)

# @time CTDirect.solve(ocp,grid_size=30,init=OptimalControlInit([0.1,0.1,0.1],0.1,0.1))

# open(Profile.print, "results/temp", "w")


#@time sol = adnlp_solve(sys)
