val x = 1.2;

fun sum_triple2(triple: int * int * int) =
    #1 triple + #2 triple + #3 triple

fun sum_triple1(x, y, z) =
    x + y + z

fun append(xs, ys) =
    case xs of
        [] => ys
      | x::xs' => x::append(xs', ys)

fun add (x: ''a, y: ''a) =
    x = y

(* sum_triple1 (1.2, 2.2, 3.2); *)