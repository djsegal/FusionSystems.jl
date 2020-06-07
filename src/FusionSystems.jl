module FusionSystems

  using Roots
  using SymEngine

  using ImportMacros
  @import SpecialFunctions.gamma as Gamma

  const A = 2.5 # D-T Fuel [AMU's]

  const H_max = 4
  const I_M_max = 25
  const n_20_max = 4
  const nu_J_max = 2
  const T_k_max = 40
  const B_C_max = 40

  const checked_min = 0.1
  const nu_J_min = -1/2

  const R_0_min = 1.0
  const R_0_max = 10.0

  const mu_0 = 4 * pi * 1e-7

  include("reactor.jl")
  include("coeff.jl")

  include("decks/index.jl")
  include("coeffs/index.jl")
  include("solvers/index.jl")

end
