using NLPModelsJuMP

function mathopt_solve(sys)

    nlp = MathOptNLPModel(sys)
    
    function callback(alg_mod::Cint,
        iter_count::Cint,
        obj_value::Float64,
        inf_pr::Float64,
        inf_du::Float64,
        mu::Float64,
        d_norm::Float64,
        regularization_size::Float64,
        alpha_du::Float64,
        alpha_pr::Float64,
        ls_trials::Cint)
        problem = solver.problem
        Ipopt.GetIpoptCurrentIterate(
            problem,
            false,
            problem.n,
            problem.x,
            problem.mult_x_L,
            problem.mult_x_U,
            problem.m,
            problem.g,
            problem.mult_g,
        )
        if iter_count==0
            println("\nCalls   Objective   ‖x‖   ‖u‖   Step   Constraint \n")
        end
        print(iter_count)
        print("   ",obj_value)
        print("   ","x")#problem.x[1:3])
        print("   ","u")#problem.x[4:end])
        print("   ",alpha_pr)
        println("   ",inf_pr)

        return true
    end
    solver = IpoptSolver(nlp)
    ipopt_solution = NLPModelsIpopt.solve!(solver, nlp, tol = 1e-12, mu_strategy="adaptive", sb="yes")
end