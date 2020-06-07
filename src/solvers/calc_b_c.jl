function calc_B_C(reactor, R_0, B_0)
  tmp_epsilon_B = reactor.epsilon + reactor.b / R_0

  B_0 / ( 1 - tmp_epsilon_B )
end
