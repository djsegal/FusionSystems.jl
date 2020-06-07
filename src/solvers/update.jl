@coeff function update!(reactor::Reactor)
  reactor.I_M = calc_I_M(reactor, R_0, B_0)
  reactor.n_20 = calc_n_20(reactor, R_0, B_0)
  reactor.T_k = calc_T_k(reactor, R_0, B_0)
  reactor.H = calc_H(reactor, R_0, B_0)

  reactor.q_star = calc_q_star(reactor, R_0, B_0)
  reactor.P_W = calc_P_W(reactor, R_0, B_0)
  reactor.h_para = calc_h_para(reactor, R_0, B_0)
  reactor.cost = calc_cost(reactor, R_0, B_0)
  reactor.B_C = calc_B_C(reactor, R_0, B_0)
end
