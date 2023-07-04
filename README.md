Comparison between hessian and jacobian of ADNLModels and JuMP (converted to NLPModel) (time and memory)

Results : 
```rust
JuMP
Hessian of Lagrangian
  50.048 μs (137 allocations: 24.08 KiB)
Jacobian of constraints
  10.558 μs (15 allocations: 19.80 KiB)
ADNLP
Hessian of Lagrangian
  9.367 ms (9638 allocations: 1.45 MiB)
Jacobian of constraints
  11.167 μs (22 allocations: 20.27 KiB)
Norm of difference between jump and adnlp hessians = 0.0
```