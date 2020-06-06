coeff_list = [
  "K_b", "K_beta", "K_BS", "K_CD",
  "K_F", "K_G", "K_I", "K_n", "K_T",
  "C_B", "epsilon_B", "K_H", "K_L",
  "a", "c", "f_B", "Tau", "K_tau",
  "G", "K_OH", "zeta", "D", "K_omega"
]

macro coeff(block)
  @assert block.head == :function

  coeff_fields!(block)
  coeff_functions!(block)

  block
end

function coeff_fields!(block::Expr)
  for fieldname in fieldnames(Reactor)
    sub_block = quote
      $(fieldname) = getfield(reactor, Symbol($(string(fieldname))))
    end

    insert!(block.args[2].args, 2, sub_block)
  end
end

function coeff_functions!(block::Expr, block_name=nothing)
  isnothing(block_name) && ( block_name = block.args[1].args[1] )

  for (index, arg) in enumerate(block.args)
    isa(arg, Expr) && coeff_functions!(arg, block_name)

    if isa(arg, Symbol) && string(arg) in coeff_list
      ( arg == block_name ) && continue

      block.args[index] = quote
        $(arg)(reactor)
      end

      continue
    end
  end
end
