function bisection_indices(right_value, left_value=1, is_first_call=true)
  ( right_value - left_value == 1 ) && return []

  mid_value = (left_value + right_value) ÷ 2

  cur_indices = []
  push!(cur_indices, mid_value)

  this_list = bisection_indices(mid_value, left_value, false)
  that_list = bisection_indices(right_value, mid_value, false)

  append!(cur_indices, collect(Base.Iterators.flatten(zip(this_list, that_list))))

  this_length = length(this_list)
  that_length = length(that_list)

  if this_length != that_length
    @assert abs(this_length - that_length) == 1
    if this_length > that_length
      push!(cur_indices, this_list[end])
    else
      push!(cur_indices, that_list[end])
    end
  end

  unique(cur_indices)
end
