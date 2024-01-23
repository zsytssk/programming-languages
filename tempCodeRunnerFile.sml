fun count_wild_and_variable_lengths(s) =
    let
        fun check_wild () = 1
        fun check_val (x) = String.size(x)
        val calc = g check_wild check_val
    in
        calc p
    end