function jump_solve(sys)
    # Solves for the control and state
    println("Solving...")
    status = optimize!(sys)

    if termination_status(sys) == MOI.OPTIMAL
        println("Solution is optimal")
    elseif termination_status(sys) == MOI.LOCALLY_SOLVED
        println("Local solution found")
    elseif termination_status(sys) == MOI.TIME_LIMIT && has_values(sys)
        println("Solution is suboptimal due to a time limit, but a primal solution is available")
    else
        error("The model was not solved correctly.")
    end
    println("Objective value = ", objective_value(sys), "\n")

    # Retrieves values (including duals - sign convention according to Pontrjagin max principle)
    Δtt = value.(Δt)
    t = (1:N+1)*Δtt; t = (t[1:end-1] + t[2:end])/2.0
    rr = value.(r); rr = (rr[1:end-1] + rr[2:end])/2.0
    vv = value.(v); vv = (vv[1:end-1] + vv[2:end])/2.0
    mm = value.(m); mm = (mm[1:end-1] + mm[2:end])/2.0
    uu = value.(u); uu = (uu[1:end-1] + uu[2:end])/2.0
    x =  [ [ rr[i], vv[i], mm[i] ] for i in 1:N ]
    p = -[ [ dual(con_dr[i]), dual(con_dv[i]), dual(con_dm[i]) ] for i in 1:N ];
end