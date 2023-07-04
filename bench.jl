using ADNLPModels
using NLPModels
using NLPModelsJuMP
using BenchmarkTools
using JuMP
using LinearAlgebra

# we compare this problem: https://control-toolbox.org/CTProblems.jl/stable/problems/double_integrator_time.html#DIT

include("get_models.jl")

adnlp, λa, xuv0  = get_adnlp_model_ct()
jump_nlp, λj, _  = get_jump_model_ct()

println("JuMP")
println("Hessian of Lagrangian")
hess(jump_nlp, xuv0, λj)
@btime hess(jump_nlp, xuv0, λj); # Hessian of Lagrangian
println("Jacobian of constraints")
jac(jump_nlp, xuv0)
@btime jac(jump_nlp, xuv0); # Jacobian of constraints


println("ADNLP")
println("Hessian of Lagrangian")
hess(adnlp, xuv0, λa)
@btime hess(adnlp, xuv0, λa)
println("Jacobian of constraints")
jac(adnlp, xuv0)
@btime jac(adnlp, xuv0) 

println("Norm of difference between jump and adnlp hessians = ",norm(hess(adnlp, xuv0, λa) .- hess(jump_nlp, xuv0, λj)))