@coeff function K_H(reactor::Reactor)
  cur_K = 2.272

  cur_K *= K_L * K_beta ^ 1.34 * K_F ^ 1.17

  cur_K /= A ^ 0.19 * epsilon ^ 0.58 * kappa ^ 0.78 * K_G ^ 0.41 * P_F ^ 0.48

  cur_K *= ( Q / ( Q + 5 ) ) ^ 0.31

  cur_K
end
