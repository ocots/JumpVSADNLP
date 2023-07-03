using ADNLPModels
using NLPModels
using NLPModelsJuMP
using BenchmarkTools
using JuMP
using NLPModelsIpopt
using LinearAlgebra

# we compare this problem: https://control-toolbox.org/CTProblems.jl/stable/problems/double_integrator_time.html#DIT

include("get_models.jl")

adnlp, λa, xuv0  = get_adnlp_model_ct()
jump_nlp, λj, _  = get_jump_model_ct()

println("Hessian of Lagrangian")
println("JuMP")
hess(jump_nlp, xuv0, λj)
@btime hess(jump_nlp, xuv0, λj); # Hessian of Lagrangian
println("Jacobian of constraints")
println("JuMP")
jac(jump_nlp, xuv0)
@btime jac(jump_nlp, xuv0); # Jacobian of constraints


println("Hessian of Lagrangian")
println("ADNLP")
hess(adnlp, xuv0, λa)
@btime hess(adnlp, xuv0, λa)
println("Jacobian of constraints")
println("ADNLP")
jac(adnlp, xuv0)
@btime jac(adnlp, xuv0) 

println("Norm of difference between jump and adnlp hessians = ",norm(hess(adnlp, xuv0, λa) .- hess(jump_nlp, xuv0, λj)))

solver_jp = IpoptSolver(jump_nlp)
ipopt_solution_jp = NLPModelsIpopt.solve!(solver_jp, jump_nlp, tol = 1e-12, mu_strategy="adaptive", sb="yes", print_level = 0)

solver_ad = IpoptSolver(adnlp)
ipopt_solution_ad = NLPModelsIpopt.solve!(solver_ad, adnlp, tol = 1e-12, mu_strategy="adaptive", sb="yes", print_level = 0)
println("Norm of objectiv difference = ",norm(ipopt_solution_ad.solution[end]-ipopt_solution_jp.solution[end]))