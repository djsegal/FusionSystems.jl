function calc_h_para(reactor, R_0, B_0)
  Q_term = ( reactor.Q + 5 ) / ( reactor.Q * 5 )

  Q_term * reactor.P_F * B_0 / R_0
end
