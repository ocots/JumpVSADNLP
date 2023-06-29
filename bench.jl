using ADNLPModels
using NLPModels
using NLPModelsJuMP
using BenchmarkTools
using JuMP

# we compare this problem: https://control-toolbox.org/CTProblems.jl/stable/problems/double_integrator_time.html#DIT

include("models.jl")

adnlp, λa, xuv0  = get_adnlp_model()
adnlp1, λa1, xuv01  = get_adnlp_model1()
adnlp2, λa2, xuv02  = get_adnlp_model2()

jump_nlp, λj, _  = get_jump_model()
jump_nlp2, λj2, _  = get_jump_model2()

println("Hessian of Lagrangian")
println("ADNLP")
hess(adnlp2, xuv0, λa)
@btime hess(adnlp2, xuv0, λa)
println("JuMP")
hess(jump_nlp2, xuv0, λj)
@btime hess(jump_nlp2, xuv0, λj); # Hessian of Lagrangian

# compare jacobian of constraints
println("Jacobian of constraints")
println("ADNLP")
jac(adnlp2, xuv0)
@btime jac(adnlp2, xuv0) # Jacobian of constraints
println("JuMP")
jac(jump_nlp2, xuv0)
@btime jac(jump_nlp2, xuv0); # Jacobian of constraints

#
nothing