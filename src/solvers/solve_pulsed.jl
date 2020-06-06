@coeff function solve_pulsed!(reactor::Reactor)
  LHS_this = log((1+epsilon_B)/(1-epsilon_B))/(1-epsilon_B)
  LHS_that = 4*epsilon_B/(1-epsilon_B^2)

  LHS = 1 - epsilon_B
  LHS -= B_0^2 / (4*mu_0*sigma_max) * (LHS_this+LHS_that)

  RHS_this = (
    1 + R_0^2 / ( ( kappa * a + b + c ) ^ 2 )
  ) ^ (1/4)

  RHS_that = sqrt( 1 - f_B + Tau )

  RHS = K_OH * RHS_this * RHS_that / ( B_0 * R_0 ^ 2 ) ^ (5/4)

  equation = real(LHS - RHS)

  root_function = function (tmp_R_0)
    tmp_error = subs(equation, symbols(:R_0) => tmp_R_0)

    if isa(nu_J, SymEngine.Basic)
      tmp_nu_J = calc_nu_J(reactor, tmp_R_0, B_0)
      tmp_error = subs(tmp_error, symbols(:nu_J) => tmp_nu_J)
    end

    real(tmp_error)
  end

  function_roots = find_zeros(root_function, R_0_min, R_0_max)

  if isempty(function_roots)
    reactor.R_0 = NaN
  else
    # just use largest reactor
    chosen_R_0 = function_roots[end]

    reactor.R_0 = chosen_R_0

    if isa(nu_J, SymEngine.Basic)
      reactor.nu_J = calc_nu_J(reactor, chosen_R_0, B_0)
    end
  end
end
