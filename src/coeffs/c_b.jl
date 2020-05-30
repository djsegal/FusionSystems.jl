@coeff function C_B(reactor::Reactor)
  _gamma(value) = Gamma(value) / Gamma(nu_p+value)

  nu_p = nu_n + nu_T

  cur_C_B = _gamma(5/4)

  cur_C_B += 2*(1-3*nu_J)*_gamma(9/4)
  cur_C_B += (1-4*nu_J+9*nu_J^2)*_gamma(13/4)
  cur_C_B += 2*nu_J*(1-3*nu_J)*_gamma(17/4)
  cur_C_B += nu_J^2*_gamma(21/4)

  cur_C_B *= Gamma(nu_p) / ((1-nu_J)^2)
end
