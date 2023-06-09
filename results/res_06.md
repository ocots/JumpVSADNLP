
JUMP resolution

Solving...
This is Ipopt version 3.14.13, running with linear solver MUMPS 5.6.0.

Number of nonzeros in equality constraint Jacobian...:      573
Number of nonzeros in inequality constraint Jacobian.:        0
Number of nonzeros in Lagrangian Hessian.............:     1710

Total number of variables............................:      125
                     variables with only lower bounds:       32
                variables with lower and upper bounds:       93
                     variables with only upper bounds:        0
Total number of equality constraints.................:       93
Total number of inequality constraints...............:        0
        inequality constraints with only lower bounds:        0
   inequality constraints with lower and upper bounds:        0
        inequality constraints with only upper bounds:        0

iter    objective    inf_pr   inf_du lg(mu)  ||d||  lg(rg) alpha_du alpha_pr  ls
   0  1.0100000e+00 3.96e-01 2.00e+00  -1.0 0.00e+00    -  0.00e+00 0.00e+00   0
   1  1.0202183e+00 1.76e-01 1.98e+03  -1.0 1.61e+00    -  1.32e-02 5.54e-01f  1
   2  1.0168964e+00 1.43e-01 1.67e+03  -1.7 2.29e-01   2.0 2.79e-01 1.91e-01h  1
   3  1.0140851e+00 1.10e-01 1.23e+03  -1.7 2.58e-01   1.5 5.88e-01 2.26e-01h  1
   4  1.0086417e+00 8.11e-02 1.04e+03  -1.7 1.24e+00    -  1.44e-01 2.66e-01h  1
   5  1.0082199e+00 6.64e-02 8.19e+02  -1.7 5.28e-01   1.0 9.26e-01 1.81e-01h  1
   6  1.0054680e+00 2.64e-02 1.58e+02  -1.7 1.82e-01    -  8.15e-01 6.02e-01h  1
   7  1.0037398e+00 3.67e-04 9.93e+01  -2.5 2.04e-01    -  9.25e-01 9.97e-01h  1
   8  1.0038410e+00 2.39e-06 1.99e+00  -3.8 1.94e-02    -  9.92e-01 1.00e+00h  1
   9  1.0092921e+00 4.04e-03 7.41e+03  -3.8 1.30e+00    -  1.67e-01 6.65e-01f  1
iter    objective    inf_pr   inf_du lg(mu)  ||d||  lg(rg) alpha_du alpha_pr  ls
  10  1.0089843e+00 2.14e-03 4.23e+03  -3.8 6.47e-01    -  6.61e-01 1.00e+00f  1
  11  1.0087179e+00 2.41e-04 1.65e-03  -3.8 3.01e-01    -  1.00e+00 1.00e+00h  1
  12  1.0102284e+00 2.71e-04 2.54e+03  -5.7 1.31e-01    -  8.29e-01 1.00e+00h  1
  13  1.0119180e+00 4.96e-04 3.65e+02  -5.7 1.53e-01    -  8.56e-01 7.32e-01h  1
  14  1.0122593e+00 2.18e-04 1.93e+01  -5.7 1.82e-01    -  9.47e-01 6.04e-01h  1
  15  1.0124544e+00 1.48e-04 1.30e-03  -5.7 1.99e-01    -  1.00e+00 1.00e+00f  1
  16  1.0124458e+00 4.80e-06 9.40e-05  -5.7 7.61e-02    -  1.00e+00 1.00e+00h  1
  17  1.0125103e+00 1.38e-05 5.79e+00  -8.6 9.23e-02    -  8.37e-01 8.05e-01h  1
  18  1.0125224e+00 1.22e-05 4.82e+00  -8.6 1.59e-01    -  8.51e-01 7.40e-01h  1
  19  1.0125259e+00 6.70e-06 1.21e+00  -8.6 9.05e-02    -  1.00e+00 8.70e-01h  1
iter    objective    inf_pr   inf_du lg(mu)  ||d||  lg(rg) alpha_du alpha_pr  ls
  20  1.0125263e+00 3.43e-07 7.55e-06  -8.6 4.04e-02    -  1.00e+00 1.00e+00f  1
  21  1.0125262e+00 3.42e-08 6.09e-07  -8.6 1.32e-02    -  1.00e+00 1.00e+00h  1
  22  1.0125262e+00 2.15e-09 4.47e-08  -8.6 3.37e-03    -  1.00e+00 1.00e+00h  1

Number of Iterations....: 22

                                   (scaled)                 (unscaled)
Objective...............:  -1.0125262368740930e+00    1.0125262368740930e+00
Dual infeasibility......:   4.4724775058431088e-08    4.4724775058431088e-08
Constraint violation....:   2.1510521835965690e-09    2.1510521835965690e-09
Variable bound violation:   0.0000000000000000e+00    0.0000000000000000e+00
Complementarity.........:   2.7266263765940232e-09    2.7266263765940232e-09
Overall NLP error.......:   2.7266263765940232e-09    4.4724775058431088e-08


Number of objective function evaluations             = 23
Number of objective gradient evaluations             = 23
Number of equality constraint evaluations            = 23
Number of inequality constraint evaluations          = 0
Number of equality constraint Jacobian evaluations   = 23
Number of inequality constraint Jacobian evaluations = 0
Number of Lagrangian Hessian evaluations             = 22
Total seconds in IPOPT                               = 0.053

EXIT: Optimal Solution Found.
Local solution found
Objective value = 1.012526236874093

  3.265463 seconds (7.94 M allocations: 468.739 MiB, 5.03% gc time, 98.15% compilation time)

JUMP -> MathOptNLPModel NLPModelsIpopt resolution

This is Ipopt version 3.14.13, running with linear solver MUMPS 5.6.0.

Number of nonzeros in equality constraint Jacobian...:      573
Number of nonzeros in inequality constraint Jacobian.:        0
Number of nonzeros in Lagrangian Hessian.............:     1710

Total number of variables............................:      125
                     variables with only lower bounds:       32
                variables with lower and upper bounds:       93
                     variables with only upper bounds:        0
Total number of equality constraints.................:       93
Total number of inequality constraints...............:        0
        inequality constraints with only lower bounds:        0
   inequality constraints with lower and upper bounds:        0
        inequality constraints with only upper bounds:        0

iter    objective    inf_pr   inf_du lg(mu)  ||d||  lg(rg) alpha_du alpha_pr  ls
   0  1.0100000e+00 3.96e-01 2.00e+00   0.0 0.00e+00    -  0.00e+00 0.00e+00   0
   1  1.0127493e+00 1.69e-01 3.32e+03  -1.4 1.56e+00    -  1.10e-02 5.72e-01f  1
   2  1.0078288e+00 1.45e-02 2.23e+03  -0.9 2.15e-01    -  6.53e-01 9.15e-01h  1
   3  1.0067455e+00 1.10e-03 7.64e+02  -1.6 1.70e-01    -  6.53e-01 9.24e-01f  1
   4  1.0065996e+00 1.25e-05 2.39e+01  -3.0 3.61e-02    -  9.72e-01 9.90e-01h  1
   5  1.0067557e+00 6.45e-06 1.36e+00  -3.9 3.53e-02    -  9.87e-01 9.91e-01h  1
   6  1.0090326e+00 2.53e-04 1.55e-01  -4.5 2.15e-01    -  1.00e+00 1.00e+00h  1
   7  1.0114678e+00 7.01e-04 3.87e+02  -4.8 3.89e-01    -  1.00e+00 7.08e-01h  1
   8  1.0121530e+00 8.09e-05 5.26e+00  -5.1 8.98e-02    -  1.00e+00 9.95e-01h  1
   9  1.0124131e+00 1.10e-04 1.76e-03  -5.6 1.45e-01    -  1.00e+00 1.00e+00h  1
iter    objective    inf_pr   inf_du lg(mu)  ||d||  lg(rg) alpha_du alpha_pr  ls
  10  1.0124796e+00 2.63e-05 3.39e-04  -6.0 7.47e-02    -  1.00e+00 1.00e+00h  1
  11  1.0125117e+00 1.56e-05 7.45e-02  -6.5 1.55e-01    -  9.99e-01 1.00e+00h  1
  12  1.0125237e+00 1.07e-05 6.26e-02  -7.2 1.17e-01    -  1.00e+00 9.98e-01h  1
  13  1.0125249e+00 2.12e-06 1.34e-02  -7.5 5.48e-02    -  1.00e+00 9.96e-01h  1
  14  1.0125262e+00 2.45e-07 3.97e-02  -8.4 3.32e-02    -  1.00e+00 9.87e-01h  1
  15  1.0125263e+00 5.64e-08 9.85e-07  -9.5 1.63e-02    -  1.00e+00 1.00e+00h  1
  16  1.0125263e+00 6.32e-09 1.42e-07 -11.1 5.81e-03    -  1.00e+00 1.00e+00h  1
  17  1.0125263e+00 2.78e-10 8.15e-09 -11.6 1.19e-03    -  1.00e+00 1.00e+00h  1
  18  1.0125263e+00 8.43e-13 2.60e-10 -12.2 6.52e-05    -  1.00e+00 1.00e+00h  1
  19  1.0125263e+00 2.22e-16 2.56e-11 -12.3 3.83e-07    -  1.00e+00 1.00e+00h  1

Number of Iterations....: 19

                                   (scaled)                 (unscaled)
Objective...............:  -1.0125263397979092e+00    1.0125263397979092e+00
Dual infeasibility......:   2.5562596984282328e-11    2.5562596984282328e-11
Constraint violation....:   2.2204460492503131e-16    2.2204460492503131e-16
Variable bound violation:   9.9387331697897707e-09    9.9387331697897707e-09
Complementarity.........:   7.0717400015390133e-13    7.0717400015390133e-13
Overall NLP error.......:   7.0717400015390133e-13    2.5562596984282328e-11


Number of objective function evaluations             = 20
Number of objective gradient evaluations             = 20
Number of equality constraint evaluations            = 20
Number of inequality constraint evaluations          = 0
Number of equality constraint Jacobian evaluations   = 20
Number of inequality constraint Jacobian evaluations = 0
Number of Lagrangian Hessian evaluations             = 19
Total seconds in IPOPT                               = 0.051

EXIT: Optimal Solution Found.
  0.078874 seconds (41.80 k allocations: 3.793 MiB, 21.13% compilation time)

CTDirect OCPModel -> ADNLPModel NLPModelsIpopt resolution

This is Ipopt version 3.14.13, running with linear solver MUMPS 5.6.0.

Number of nonzeros in equality constraint Jacobian...:      574
Number of nonzeros in inequality constraint Jacobian.:        0
Number of nonzeros in Lagrangian Hessian.............:      341

Total number of variables............................:      125
                     variables with only lower bounds:       31
                variables with lower and upper bounds:       62
                     variables with only upper bounds:        0
Total number of equality constraints.................:       94
Total number of inequality constraints...............:        0
        inequality constraints with only lower bounds:        0
   inequality constraints with lower and upper bounds:        0
        inequality constraints with only upper bounds:        0

iter    objective    inf_pr   inf_du lg(mu)  ||d||  lg(rg) alpha_du alpha_pr  ls
   0 -1.0100000e+00 9.00e-01 2.00e+00   0.0 0.00e+00    -  0.00e+00 0.00e+00   0
   1 -1.0030260e+00 7.00e-01 2.48e+02  -0.7 9.00e-01    -  4.85e-03 2.22e-01f  1
   2 -1.0093386e+00 1.84e-01 1.18e+02  -0.7 7.00e-01   2.0 9.97e-01 7.37e-01h  1
   3 -1.0096326e+00 1.07e-01 1.22e+02  -0.4 3.59e-01   1.5 1.00e+00 4.17e-01h  1
   4 -1.0084386e+00 1.07e-03 2.97e+01  -0.6 3.26e-01    -  8.12e-01 9.90e-01h  1
   5 -1.0080173e+00 8.40e-05 1.77e+01  -2.2 5.92e-02    -  9.57e-01 9.90e-01h  1
   6 -1.0080420e+00 1.73e-07 2.79e+00  -7.7 2.19e-03    -  9.85e-01 9.98e-01h  1
   7 -1.0097714e+00 1.37e-04 3.07e+02  -4.7 7.07e-02    -  7.89e-01 1.00e+00f  1
   8 -1.0124338e+00 9.26e-04 6.15e+00  -4.7 2.00e-01    -  1.00e+00 9.84e-01h  1
   9 -1.0123613e+00 1.24e-04 4.87e-03  -5.3 1.13e-01    -  1.00e+00 1.00e+00h  1
iter    objective    inf_pr   inf_du lg(mu)  ||d||  lg(rg) alpha_du alpha_pr  ls
  10 -1.0124870e+00 7.79e-05 4.60e+00  -5.9 1.25e-01    -  1.00e+00 9.86e-01h  1
  11 -1.0125120e+00 1.97e-05 5.85e-01  -6.3 1.20e-01    -  1.00e+00 9.93e-01h  1
  12 -1.0125239e+00 1.49e-05 2.24e-01  -7.1 1.52e-01    -  1.00e+00 9.94e-01h  1
  13 -1.0125262e+00 5.03e-06 1.80e-05  -8.1 8.24e-02    -  1.00e+00 1.00e+00h  1
  14 -1.0125262e+00 3.28e-07 1.04e-06  -8.4 3.53e-02    -  1.00e+00 1.00e+00h  1
  15 -1.0125263e+00 5.01e-08 5.29e-07  -9.9 1.66e-02    -  1.00e+00 1.00e+00h  1
  16 -1.0125263e+00 6.48e-09 8.31e-08 -11.7 5.91e-03    -  1.00e+00 1.00e+00h  1
  17 -1.0125263e+00 2.83e-10 3.33e-09 -12.3 1.20e-03    -  1.00e+00 1.00e+00h  1
  18 -1.0125263e+00 7.57e-13 8.43e-12 -12.3 6.11e-05    -  1.00e+00 1.00e+00h  1

Number of Iterations....: 18

                                   (scaled)                 (unscaled)
Objective...............:  -1.0125263392620425e+00   -1.0125263392620425e+00
Dual infeasibility......:   8.4322266966417110e-12    8.4322266966417110e-12
Constraint violation....:   1.5765166949677223e-13    7.5696393597723964e-13
Variable bound violation:   9.9161631406108341e-09    9.9161631406108341e-09
Complementarity.........:   5.9181867333975404e-13    5.9181867333975404e-13
Overall NLP error.......:   5.9181867333975404e-13    8.4322266966417110e-12


Number of objective function evaluations             = 19
Number of objective gradient evaluations             = 19
Number of equality constraint evaluations            = 19
Number of inequality constraint evaluations          = 0
Number of equality constraint Jacobian evaluations   = 19
Number of inequality constraint Jacobian evaluations = 0
Number of Lagrangian Hessian evaluations             = 18
Total seconds in IPOPT                               = 7.932

EXIT: Optimal Solution Found.
  8.094657 seconds (37.68 M allocations: 10.733 GiB, 7.36% gc time, 4.39% compilation time)
