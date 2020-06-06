@coeff function G(reactor::Reactor)
  nu_0 = 1 + 1.5 * nu_T

  _gamma(value) = Gamma(nu_0) * Gamma(value) / Gamma(nu_0+value)

  cur_value = 1/nu_0 - 2*sqrt(epsilon)*_gamma(5/4) + epsilon*_gamma(3/2)

  cur_value *= (1 + nu_T) ^ 1.5

  cur_value
end
