for coeff_name in coeff_list
  include(lowercase(coeff_name) * ".jl")
end
