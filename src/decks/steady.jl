function Steady(; kwargs...)
  cur_dict = Dict{Symbol, AbstractFloat}(
    :N_G => 0.85,
    :kappa => 1.8,
    :epsilon => 0.25,
    :beta_N => 0.026,
    :Q => 26,
    :f_D => 0.85,
    :eta_CD => 0.35,
    :B_max => 23,
    :P_F => 500,
    :b => 1,
    :nu_n => 0.4,
    :nu_T => 1.1,
    :nu_J => 0.453,
    :eta_T => 0.4,
    :eta_RF => 0.5
  )

  merge!(cur_dict, kwargs)

  Reactor(; cur_dict...)
end
