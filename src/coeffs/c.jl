@coeff function c(reactor::Reactor)
  this_term = log((1+epsilon_B)/(1-epsilon_B))/(1-epsilon_B)

  that_term = 4*epsilon_B/(1-epsilon_B^2)

  cur_value = (
    ( this_term + that_term ) *
    R_0 * B_0 ^ 2 / ( 4 * mu_0 * sigma_max )
  )

  cur_value
end
