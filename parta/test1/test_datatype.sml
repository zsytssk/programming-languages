datatype mytype = TwoInts of int * int
                | Str of string
                | Pizza

fun f(x: mytype) =
    case x of
        Pizza => 3
      | Str s  => 8
      | TwoInts(i1, i2) => i1 + i2


val a = Str "hi"
val b = Str "hi"
val c = Pizza
val d = TwoInts(1, 2)
val e = a