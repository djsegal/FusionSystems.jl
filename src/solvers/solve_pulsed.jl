@coeff function solve_pulsed!(reactor::Reactor, R_0_guess=nothing)
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

    float(real(tmp_error))
  end

  if isnothing(R_0_guess) || isnan(R_0_guess)
    valid_roots = []
  else
    work_R_0 = NaN

    try
      work_R_0 = find_zero(root_function, R_0_guess)
    catch cur_error
      isa(cur_error, DomainError) || rethrow(cur_error)
    end

    if is_valid(reactor, work_R_0, B_0)
      valid_roots = [work_R_0]
    else
      valid_roots = []
    end
  end

  if isempty(valid_roots)
    function_roots = find_zeros(root_function, R_0_min, R_0_max)

    for work_R_0 in function_roots
      is_valid(reactor, work_R_0, B_0) || continue
      push!(valid_roots, work_R_0)
    end
  end

  if isempty(valid_roots)
    reactor.R_0 = NaN
  else
    @assert length(valid_roots) == 1
    chosen_R_0 = first(valid_roots)

    reactor.R_0 = chosen_R_0

    if isa(nu_J, SymEngine.Basic)
      reactor.nu_J = calc_nu_J(reactor, chosen_R_0, B_0)
    end
  end
end
