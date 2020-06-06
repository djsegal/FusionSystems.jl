@coeff function K_OH(reactor::Reactor)
  sqrt(
    K_omega * K_I * D^2 /
    ( K_T^1.5 * sqrt(2 * mu_0 * sigma_max_hat) )
  )
end
