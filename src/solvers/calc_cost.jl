function calc_cost(reactor, R_0, B_0)
  this_term = 1 + reactor.b / ( reactor.epsilon * R_0 * reactor.kappa )
  that_term = 1 + reactor.b / ( reactor.epsilon * R_0 )

  K_TF = 10 * this_term * that_term * reactor.epsilon^2 * reactor.kappa
  K_C = K_TF / reactor.P_F

  K_C * (R_0^3) * (B_0^2)
end
