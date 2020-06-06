function DEMO(; kwargs...)
  cur_dict = Dict{Symbol, AbstractFloat}(
    :N_G => 1.2,
    :kappa => 1.59,
    :epsilon => 0.323,
    :beta_N => 0.0259,
    :Q => 39.9,
    :f_D => 0.775,
    :P_F => 2037,
    :B_max => 12.3,
    :B_max_hat => 12.9,
    :sigma_max => 660e6,
    :sigma_max_hat => 660e6,
    :tau_P => 2,
    :b => 1.63,
    :nu_n => 0.27,
    :nu_T => 1.094,
    :eta_T => 0.4,
    :eta_RF => 0.75
  )

  merge!(cur_dict, kwargs)

  Reactor(; cur_dict...)
end
