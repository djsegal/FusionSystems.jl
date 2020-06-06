@coeff function D(reactor::Reactor)
  ( 1 + zeta ) / ( zeta^0.25 ) / sqrt( 1 + zeta + zeta^2 / 3 )
end
