function get_adnlp_model_ct()

    # parameters
    n=2
    m=1
    t0=0.0
    x0=[-1, 0]
    xf=[0, 0]
    γ = 1
    N = 30

    # adnlp model
    obj_fun(xuv) = xuv[end] # objectiv
    dim_v = (N+1)*(2+1) + 1 # dimension of vector xu+v
    xuv0 = fill(0.5, dim_v)
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
   
    lb = zeros((N)*2 + 4)
    ub = zeros((N)*2 + 4)
    lb[1:2] = x0
    lb[3:4] = xf
    ub[1:2] = x0
    ub[3:4] = xf
    function con_fun(c, xuv, t0::Float64 = t0, N::Int = N) 
        h = (xuv[end]-t0)/N
        xi = view(xuv, 1:2) # state at time 0
        ui = xuv[2*(N+1)+1] # control at time 0
        index = 1
        offset =  4
        for i = 1:N   
            xip1 = view(xuv, ((i+1)*2-1):((i+1)*2)) # state at time i+1
            uip1 = xuv[2*(N+1)+i+1] # control at time i+1
            c[offset + index] = xip1[1] - (xi[1] + 0.5*h*(xi[2] + xip1[2]))
            c[offset + index + 1] = xip1[2] - (xi[2] + 0.5*h*(ui + uip1))
            index = index + 2
            xi = xip1
            ui = uip1
        end
        c[1:2] = view(xuv, 1:2)
        c[3:4] = view(xuv, (2*(N+1)-1):(2*(N+1)))
        return(c)
    end 
    # Check that it doesn't allocate
    cx = similar(lb)
    con_fun(cx, xuv0)
    a = @allocated con_fun(cx, xuv0)
    @assert a == 0

    adnlp = ADNLPModel!(obj_fun, xuv0, l_var, u_var, con_fun, lb, ub)

    λa = ones(adnlp.meta.ncon) # Lagrange multipliers  
    
    return adnlp, λa, xuv0
end


function get_jump_model_ct()

    # parameters
    n=2
    m=1
    t0=0.0
    x0=[-1, 0]
    xf=[0, 0]
    γ = 1
    N = 30

    # jump model
    sys = JuMP.Model()

    JuMP.@variables(sys, begin
        x[1:2*(N+1)]
        -γ ≤ u[1:N+1] ≤ γ
        0 ≤ tf
    end)

    set_start_value(tf, 0.5)
    set_start_value(x[1], 0.5)
    set_start_value(x[2], 0.5)
    set_start_value(u[1], 0.5)

    @objective(sys, Min, tf)

    JuMP.@NLconstraints(sys, begin
        con_x₁0, x[1] == x0[1]
        con_x₂0, x[2] == x0[2]
        con_x₁f, x[2*(N+1)-1] == xf[1]
        con_x₂f, x[2*(N+1)] == xf[2]
        con_dx₁[i = 1:N], x[2*i+1] == x[2*i-1] + (tf/N) * (x[2*i] + x[2*(i+1)])/2.0
        con_dx₂[i = 1:N], x[2*(i+1)] == x[2*i] + (tf/N) * (u[i] + u[i+1])/2.0
    end);

    jump_nlp = MathOptNLPModel(sys)
    λj = ones(jump_nlp.meta.ncon) # Lagrange multipliers

    return jump_nlp, λj, nothing

end