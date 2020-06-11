function is_valid(reactor, R_0, B_0)
  isnan(R_0) && return false

  ( R_0 < R_0_min ) && return false
  ( R_0 > R_0_max ) && return false

  checked_fields = [:H, :I_M, :n_20, :nu_J, :T_k, :B_C]

  tmp_is_valid = true

  for checked_field in checked_fields
    work_value = getfield(
      FusionSystems, Symbol("calc_$(checked_field)")
    )(reactor, R_0, B_0)

    work_max = getfield(
      FusionSystems, Symbol("$(checked_field)_max")
    )

    if isdefined(FusionSystems, Symbol("$(checked_field)_min"))
      work_min = getfield(FusionSystems, Symbol("$(checked_field)_min"))
    else
      work_min = checked_min
    end

    ( work_min < work_value < work_max ) && continue
    tmp_is_valid = false
    break
  end

  tmp_is_valid
end
