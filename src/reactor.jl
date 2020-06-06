const SolvedVariable = Union{AbstractFloat, SymEngine.Basic}
const InputVariable = Union{AbstractFloat}

mutable struct Reactor
  solved::Bool
  steady::Bool
  valid::Bool

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
  nu_J::Union{InputVariable,SolvedVariable}
  eta_T::InputVariable
  eta_RF::InputVariable
  sigma_max::InputVariable
  B_max_hat::InputVariable
  sigma_max_hat::InputVariable
  tau_P::InputVariable
end

function Reactor(;
    solved=false, valid=true, steady=nothing,
    B_0=symbols(:B_0), R_0=symbols(:R_0), I_M=symbols(:I_M),
    n_20=symbols(:n_20), T_k=symbols(:T_k), H=symbols(:H),
    N_G=NaN, kappa=NaN, epsilon=NaN, beta_N=NaN, Q=NaN, f_D=NaN,
    eta_CD=NaN, B_max=NaN, P_F=NaN, b=NaN, nu_n=NaN, nu_T=NaN,
    nu_J=NaN, eta_T=NaN, eta_RF=NaN, sigma_max=NaN, B_max_hat=NaN,
    sigma_max_hat=NaN, tau_P=NaN
  )

  if isnothing(steady)
    if isnan(tau_P)
      @assert !isnan(eta_CD)
      steady = true
    else
      steady = false
    end
  end

  if !steady && isnan(nu_J)
    nu_J = symbols(:nu_J)
  end

  Reactor(
    solved, steady, valid,
    B_0, R_0, I_M, n_20, T_k, H,
    N_G, kappa, epsilon, beta_N,
    Q, f_D, eta_CD, B_max, P_F, b,
    nu_n, nu_T, nu_J, eta_T, eta_RF,
    sigma_max, B_max_hat, sigma_max_hat,
    tau_P
  )
end

export Reactor
