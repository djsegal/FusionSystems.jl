@coeff function K_F(reactor::Reactor)
  nu_term = (1+nu_n)^2 * (1+nu_T)^2 / (1+2*(nu_n+nu_T))
  0.1392 * nu_term * (f_D*epsilon)^2 * kappa
end
