datatype exp = Constant of int
            | Negate of exp
            | Add of exp * exp
            | Multiply of exp * exp

fun eval(e: exp) =
    case e of
          Constant i => i
        | Negate e2 => ~ (eval e2)
        | Add(e1, e2) => (eval e1) + (eval e2)
        | Multiply(e1, e2) => (eval e1) * (eval e2)

fun max_constant(e: exp) =
    case e of
          Constant i => i
        | Negate e2 => max_constant e2
        | Add(e1, e2) => if max_constant e1 > max_constant e2
                         then max_constant e1
                         else max_constant e2
        | Multiply(e1, e2) => if max_constant e1 > max_constant e2
                         then max_constant e1
                         else max_constant e2


val test_exp = Add(Constant 19, Add(Constant 18, Constant 1));
val res = max_constant test_exp;