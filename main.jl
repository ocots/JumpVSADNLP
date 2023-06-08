using ADNLPModels, JuMP, Ipopt, Plots, MINPACK, NLPModelsIpopt, CTBase, CTDirect
using CTBase:Model

include("solve_jump.jl")
include("solve_mathopt.jl")

#JuMP model, Ipopt solver
sys = JuMP.Model(optimizer_with_attributes(Ipopt.Optimizer,"print_level"=> 5))
set_optimizer_attribute(sys,"tol",1e-8)
set_optimizer_attribute(sys,"constr_viol_tol",1e-6)
set_optimizer_attribute(sys,"max_iter",1000)

# Parameters
Cd = 310.0
Tmax = 3.5
β = 500.0
b = 2.0
N = 30
t0 = 0.0
r0 = 1.0
v0 = 0.0
vmax = 0.1
m0 = 1.0
x0 = [ r0, v0, m0 ]
mf = 0.6

# Variables (some state constraints have been added to ease convergence)
@variables(sys, begin
    0.0 ≤ Δt                      # time step (unknown as tf is free)
    r[1:N+1] ≥ r0                 # r
    0 ≤ v[1:N+1] ≤ vmax           # v
    mf ≤ m[1:N+1] ≤ m0            # m
    0.0 ≤ u[1:N+1] ≤ 1.0          # u
end)

# Objective
@objective(sys, Max, r[N+1])

# Boundary constraints
@constraints(sys, begin
    con_r0, r[1] == r0
    con_v0, v[1] == v0
    con_m0, m[1] == m0
end)

# Dynamics
@NLexpressions(sys, begin
    # D = Cd v^2 exp(-β(r-1))
    D[i = 1:N+1], Cd * v[i]^2 * exp(-β * (r[i] - 1.0))
    # r'= v
    dr[i = 1:N+1], v[i]
    # v' = (Tmax.u-D)/m - 1/r^2
    dv[i = 1:N+1], (Tmax*u[i]-D[i])/m[i] - 1/r[i]^2
    # m' = -b.Tmax.u
    dm[i = 1:N+1], -b*Tmax*u[i]
end)

# Crank-Nicolson scheme
@NLconstraints(sys, begin
    con_dr[i = 1:N], r[i+1] == r[i] + Δt * (dr[i] + dr[i+1])/2.0
    con_dv[i = 1:N], v[i+1] == v[i] + Δt * (dv[i] + dv[i+1])/2.0
    con_dm[i = 1:N], m[i+1] == m[i] + Δt * (dm[i] + dm[i+1])/2.0
end);



# the model
# parameters
Cd = 310
Tmax = 3.5
β = 500
b = 2
t0 = 0
r0 = 1
v0 = 0
vmax = 0.1
m0 = 1
mf = 0.6
x0 = [ r0, v0, m0 ]

function F0(x)
    r, v, m = x
    D = Cd * v^2 * exp(-β*(r - 1))
    return [ v, -D/m - 1/r^2, 0 ]
end
function F1(x)
    r, v, m = x
    return [ 0, Tmax/m, -b*Tmax ]
end
f(x, u) = F0(x) + u*F1(x)

@def ocp begin
    tf ∈ R, variable
    t ∈ [ t0, tf ], time
    x ∈ R³, state
    u ∈ R, control
    x(t0) == x0,    (initial_con) 
    r = x₁
    v = x₂
    m = x₃
    m(tf) == mf,    (final_con)
    0 ≤ u(t) ≤ 1,   (u_con)
    r0 ≤ r(t) ≤ Inf, (x_con_rmin)
    0 ≤ v(t) ≤ vmax, (x_con_vmax)
    ẋ(t) == f(x(t),u(t))
    r(tf) → max
end

println("\nJUMP resolution\n")
jump_solve(sys)
println("\nJUMP -> MathOptNLPModel NLPModelsIpopt resolution\n")
mathopt_solve(sys)
println("\nCTDirect OCPModel -> ADNLPModel NLPModelsIpopt resolution\n")
CTDirect.solve(ocp,grid_size=30)