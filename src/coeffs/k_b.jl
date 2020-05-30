@coeff function K_b(reactor::Reactor)
  nu_term = (1+nu_n)*(1+nu_T) * (nu_n + 0.054*nu_T)
  0.61 * epsilon^(5/2) * kappa^1.27 * nu_term * C_B
end
