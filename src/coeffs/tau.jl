@coeff function Tau(reactor::Reactor)
  K_tau * K_T^1.5 * (log(8/epsilon) - 2) * sqrt(B_0^3 * R_0^7)
end
