@coeff function solve!(reactor::Reactor)
  @assert !reactor.solved

  @assert isa(R_0, SymEngine.Basic)
  @assert !isa(B_0, SymEngine.Basic)

  if reactor.steady
    solve_steady!(reactor)
  else
    solve_pulsed!(reactor)
  end

  if isnan(reactor.R_0)
    reactor.valid = false
  else
    update!(reactor)
  end

  reactor.solved = true

  reactor
end
