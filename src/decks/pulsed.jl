function Pulsed(; kwargs...)
  cur_dict = Dict{Symbol, AbstractFloat}(
    :N_G => 0.85,
    :kappa => 1.8,
    :epsilon => 0.25,
    :beta_N => 0.026,
    :Q => 26,
    :f_D => 0.85,
    :tau_P => 1.5,
    :sigma_max => 650e6,
    :B_max => 23,
    :sigma_max_hat => 500e6,
    :B_max_hat => 23,
    :P_F => 500,
    :b => 1,
    :nu_n => 0.4,
    :nu_T => 1.1,
    :eta_T => 0.4,
    :eta_RF => 0.75
  )

  merge!(cur_dict, kwargs)

  Reactor(; cur_dict...)
end
