const SolvedVariable = Union{AbstractFloat, Nothing}
const InputVariable = Union{AbstractFloat}

struct Reactor
  B_0::SolvedVariable
  R_0::SolvedVariable
  I_M::SolvedVariable
  n_20::SolvedVariable
  T_k::SolvedVariable
  H::SolvedVariable

  N_G::InputVariable
  kappa::InputVariable
  epsilon::InputVariable
  beta_N::InputVariable
  Q::InputVariable
  f_D::InputVariable
  eta_CD::InputVariable
  B_max::InputVariable
  P_F::InputVariable
  b::InputVariable
  nu_n::InputVariable
  nu_T::InputVariable
  nu_J::InputVariable
  eta_T::InputVariable
  eta_RF::InputVariable
end

function Reactor(;
  N_G=0.85, kappa=1.8, epsilon=0.25, beta_N=0.026, Q=26, f_D=0.85, eta_CD=0.35, B_max=23, P_F=500, b=1, nu_n=0.4, nu_T=1.1, nu_J=0.453, eta_T=0.4, eta_RF=0.5)
  Reactor(
    repeat([nothing], 6)...,
    N_G, kappa, epsilon, beta_N, Q, f_D, eta_CD, B_max, P_F, b, nu_n, nu_T, nu_J, eta_T, eta_RF
  )
end

export Reactor
