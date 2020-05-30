@coeff function K_beta(reactor::Reactor)
  nu_term = ( 1 + nu_n + nu_T ) / ( (1+nu_n) * (1+nu_T) )

  12.42 * nu_term * beta_N / epsilon
end
