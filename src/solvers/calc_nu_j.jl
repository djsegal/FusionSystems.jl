function calc_nu_J(reactor, R_0, B_0)
  tmp_I_M = calc_I_M(reactor, R_0, B_0)

  q_star = (
    5 * reactor.epsilon ^ 2 * reactor.kappa ^ 1.27 *
    B_0 * R_0 / tmp_I_M
  )

  1 - sqrt( q_star / 4 )
end
