@coeff function solve_steady!(reactor::Reactor)
  LHS = B_0

  RHS = 1 / sqrt(
    R_0^1.5 * K_BS + R_0^2 * K_CD
  )

  equation = LHS - RHS

  try
    work_R_0 = find_zero(equation, (R_0_min, R_0_max))

    if is_valid(reactor, work_R_0, B_0)
      reactor.R_0 = work_R_0
    else
      reactor.R_0 = NaN
    end
  catch
    reactor.R_0 = NaN
  end
end
