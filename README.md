Comparison between hessian and jacobian of ADNLModels and JuMP (converted to NLPModel) (time and memory)

Results : 
```rust
Hessian of Lagrangian
JuMP
  50.627 μs (137 allocations: 24.08 KiB)
Jacobian of constraints
JuMP
  10.825 μs (15 allocations: 19.80 KiB)
Hessian of Lagrangian
ADNLP
  9.302 ms (9638 allocations: 1.45 MiB)
Jacobian of constraints
ADNLP
  11.295 μs (22 allocations: 20.27 KiB)
Norm of difference between jump and adnlp hessians = 0.0
```