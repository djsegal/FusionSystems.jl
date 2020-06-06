include("calc_i_m.jl")
include("calc_n_20.jl")
include("calc_t_k.jl")
include("calc_nu_j.jl")

include("solve.jl")
include("update.jl")

include("solve_steady.jl")
include("solve_pulsed.jl")

export solve!
