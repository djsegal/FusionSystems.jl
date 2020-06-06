@coeff function update!(reactor::Reactor)
  reactor.I_M = calc_I_M(reactor, R_0, B_0)

  reactor.n_20 = calc_n_20(reactor, R_0, B_0)

  reactor.T_k = calc_T_k(reactor, R_0, B_0)

  reactor.H = K_H * B_0 ^ 1.19 * R_0 ^ 1.02
end
