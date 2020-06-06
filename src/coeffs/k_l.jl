@coeff function K_L(reactor::Reactor)
  cur_K = 17.04

  cur_K *= ( 1 + f_D ) / ( f_D ^ 2 )

  cur_K *= ( 1 + 2 * ( nu_n + nu_T ) ) / ( 1 + nu_n + nu_T )

  cur_K /= ( 1 + nu_n ) * ( 1 + nu_T )

  cur_K
end
