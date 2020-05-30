module FusionSystems

  using Revise

  using ImportMacros
  @import SpecialFunctions.gamma as Gamma

  include("reactor.jl")
  include("coeff.jl")

  include("coeffs/index.jl")

end
