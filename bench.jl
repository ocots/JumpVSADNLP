using ADNLPModels
using NLPModels
using NLPModelsJuMP
using BenchmarkTools
using JuMP

# we compare this problem: https://control-toolbox.org/CTProblems.jl/stable/problems/double_integrator_time.html#DIT

include("get_models.jl")

adnlp, λa, xuv0  = get_adnlp_model()
jump_nlp, λj, _  = get_jump_model()

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

# compare jacobian of constraints
println("JuMP")
jac(jump_nlp, xuv0)
@btime jac(jump_nlp, xuv0); # Jacobian of constraints


println(sum(sum(hess(adnlp, xuv0, λa)-hess(jump_nlp, xuv0, λj))))
nothing