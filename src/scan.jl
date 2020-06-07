struct Scan
  reactors::Vector{Reactor}
end

default_B_0_list = Vector{Number}(range(1, stop=25, length=50))

function Scan(reactor::Union{AbstractString, Symbol}, B_0_list::Vector{Number}=default_B_0_list; kwargs...)
  input_dict = Dict()

  default = getfield(FusionSystems, Symbol(reactor))()

  for (cur_key, cur_value) in kwargs
    input_dict[cur_key] = getfield(default, cur_key) * cur_value
  end

  Scan([
    solve!(
      getfield(FusionSystems, Symbol(reactor))(; B_0=B_0, input_dict...)
    ) for B_0 in B_0_list
  ])

  # solve!
end

function plot(scan::Scan, x::Symbol, y::Symbol)
  xx = filter(!isnothing, [ getfield(reactor, x) for reactor in scan.reactors ])
  yy = filter(!isnothing, [ getfield(reactor, y) for reactor in scan.reactors ])

  @assert length(xx) == length(yy)
  iszero(length(xx)) || SimplePlots.plot(xx, yy, label="")

  xlabel!(String(x))
  ylabel!(String(y))
end

export Scan
