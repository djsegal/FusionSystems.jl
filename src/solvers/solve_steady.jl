@coeff function solve_steady!(reactor::Reactor)
  LHS = B_0

  RHS = 1 / sqrt(
    R_0^1.5 * K_BS + R_0^2 * K_CD
  )

  equation = LHS - RHS

  try
    reactor.R_0 = find_zero(equation, (R_0_min, R_0_max))
  catch
    reactor.R_0 = NaN
  end
end
