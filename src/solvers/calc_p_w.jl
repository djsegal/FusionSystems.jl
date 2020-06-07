function calc_P_W(reactor, R_0, B_0)
  nu_term = ( 1 + reactor.nu_n ) ^ 2 * ( 1 + reactor.nu_T ) ^ 2
  nu_term /= ( 1 + 2 * ( reactor.nu_n + reactor.nu_T ) )

  K_W = (
    2.824e-3 * nu_term * (reactor.f_D^2) * reactor.epsilon * reactor.kappa ^0.4
  )

  tmp_n_20 = calc_n_20(reactor, R_0, B_0)
  tmp_T_k = calc_T_k(reactor, R_0, B_0)

  K_W * tmp_n_20^2 * tmp_T_k^2 * R_0
end
