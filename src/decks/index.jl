const deck_list = [
  "ARC", "DEMO",
  "Steady", "Pulsed"
]

for deck in deck_list
  include("$(lowercase(deck)).jl")
  FusionSystems.@eval export $(Symbol(deck))
end
