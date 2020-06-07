function calc_q_star(reactor, R_0, B_0)
  K_q = (
    5 * reactor.epsilon ^ 2 * reactor.kappa ^ 1.27
  )

  K_q * R_0 * B_0 / calc_I_M(reactor, R_0, B_0)
end
