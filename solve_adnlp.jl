using NLPModelsJuMP
using NLPModels
using Symbolics
using Zygote

function adnlp_solve(sys)
    monlp = MathOptNLPModel(sys)
    xu0 = NLPModels.get_x0(monlp)
    obj_fun(x) = NLPModels.obj(monlp,x)
    con_fun(x) = NLPModels.cons(monlp,x)
    l_var = NLPModels.get_lvar(monlp)
    u_var = NLPModels.get_uvar(monlp)
    l_con = NLPModels.get_lcon(monlp)
    u_con = NLPModels.get_ucon(monlp)
    adnlp_t = ADNLPModel(obj_fun, xu0, l_var, u_var, con_fun, l_con, u_con; gradient_backend = ADNLPModels.ZygoteADGradient)
    solver = IpoptSolver(adnlp_t)
    ipopt_solution = NLPModelsIpopt.solve!(solver, adnlp_t, tol = 1e-12, mu_strategy="adaptive", sb="yes")
end