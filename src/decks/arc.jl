function ARC(; kwargs...)
  cur_dict = Dict{Symbol, AbstractFloat}(
    :N_G => 0.67,
    :kappa => 1.84,
    :epsilon => 0.342,
    :beta_N => 0.0259,
    :Q => 13.6,
    :f_D => 0.85,
    :eta_CD => 0.321,
    :P_F => 525,
    :B_max => 23,
    :b => 0.85,
    :nu_n => 0.385,
    :nu_T => 0.929,
    :nu_J => 0.472,
    :eta_T => 0.4
  )

  merge!(cur_dict, kwargs)

  Reactor(; cur_dict...)
end
