struct Scan
  reactors::Vector{Reactor}
end

default_B_0_list = Vector{Number}(range(1, stop=20, length=41))

function Scan(reactor::Symbol, B_0_list::Vector{Number}=default_B_0_list; R_0_guess=R_0_max, kwargs...)
  input_dict = Dict()

  default = getfield(FusionSystems, Symbol(reactor))()

  for (cur_key, cur_value) in kwargs
    input_dict[cur_key] = getfield(default, cur_key) * cur_value
  end

  _tmp_solve(tmp_R_0, tmp_B_0) = solve!(
    getfield(FusionSystems, reactor)(; B_0=tmp_B_0, input_dict...), tmp_R_0
  )

  @assert length(B_0_list) > 1

  beg_reactor = _tmp_solve(R_0_guess, B_0_list[1])
  end_reactor = _tmp_solve(R_0_guess, B_0_list[end])

  if beg_reactor.valid && end_reactor.valid
    scan_reactors = [beg_reactor]
    R_0_guess = beg_reactor.R_0

    for B_0 in B_0_list[2:end-1]
      tmp_reactor = _tmp_solve(R_0_guess, B_0)
      @assert tmp_reactor.valid

      R_0_guess = tmp_reactor.R_0
      push!(scan_reactors, tmp_reactor)
    end

    push!(scan_reactors, end_reactor)
    return Scan(scan_reactors)
  end

  fast_scan(
    reactor, B_0_list, R_0_guess, input_dict,
    beg_reactor, end_reactor, _tmp_solve,
  )
end

function plot(scan::Scan, x::Symbol, y::Symbol)
  _filter_function(cur_value) = (
    isnothing(cur_value) || isnan(cur_value) ||
    isa(cur_value, SymEngine.Basic)
  )

  xx = [ getfield(reactor, x) for reactor in scan.reactors ]
  yy = [ getfield(reactor, y) for reactor in scan.reactors ]

  delete_indices = []
  append!(delete_indices, findall(_filter_function, xx))
  append!(delete_indices, findall(_filter_function, yy))

  delete_indices = sort(unique(delete_indices))
  deleteat!(xx, delete_indices)
  deleteat!(yy, delete_indices)

  @assert length(xx) == length(yy)
  SimplePlots.plot(xx, yy, label="")

  xlabel!(String(x))
  ylabel!(String(y))

  iszero(length(xx)) && return

  xlims!(0, 1.1*maximum(xx))
  ylims!(0, 1.1*maximum(yy))
end

function fast_scan(reactor, B_0_list, R_0_guess, input_dict, beg_reactor, end_reactor, _tmp_solve)
  scan_reactors = Vector{Reactor}(undef, length(B_0_list))

  scan_reactors[1] = beg_reactor
  scan_reactors[end] = end_reactor

  if beg_reactor.valid
    R_0_guess = beg_reactor.R_0
  elseif end_reactor.valid
    R_0_guess = end_reactor.R_0
  end

  used_index = NaN
  for cur_index in bisection_indices(length(B_0_list))
    B_0 = B_0_list[cur_index]
    tmp_reactor = _tmp_solve(R_0_guess, B_0)

    scan_reactors[cur_index] = tmp_reactor
    tmp_reactor.valid || continue

    used_index = cur_index
    R_0_guess = tmp_reactor.R_0

    break
  end

  @assert !isnan(used_index)

  init_R_0_guess = R_0_guess
  for cur_index in (used_index-1):-1:2
    B_0 = B_0_list[cur_index]
    tmp_reactor = _tmp_solve(R_0_guess, B_0)

    scan_reactors[cur_index] = tmp_reactor

    if beg_reactor.valid
      @assert tmp_reactor.valid
    else
      tmp_reactor.valid || break
    end

    R_0_guess = tmp_reactor.R_0
  end

  R_0_guess = init_R_0_guess
  for cur_index in (used_index+1):length(B_0_list)
    B_0 = B_0_list[cur_index]
    tmp_reactor = _tmp_solve(R_0_guess, B_0)

    scan_reactors[cur_index] = tmp_reactor

    if end_reactor.valid
      @assert tmp_reactor.valid
    else
      tmp_reactor.valid || break
    end

    R_0_guess = tmp_reactor.R_0
  end

  for cur_index in 1:length(B_0_list)
    isassigned(scan_reactors, cur_index) && continue
    B_0 = B_0_list[cur_index]

    tmp_reactor = getfield(FusionSystems, reactor)(; B_0=B_0, input_dict...)
    scan_reactors[cur_index] = tmp_reactor

    tmp_reactor.valid = false
    tmp_reactor.solved = true
  end

  Scan(scan_reactors)
end

export Scan
