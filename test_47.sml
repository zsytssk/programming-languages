fun fold f acc xs =
    case xs of
        [] => acc
    | x::xs' => fold f (f(acc, x)) xs'

val sum = fold (fn(x, y) => x + y) 0

fun range i j = if  i > j then [] else i ::range(i+1) j
val counup = range 1
val x = counup 6


fun exist predicate xs =
    case xs of
        [] => false
    |   x::xs' => predicate x orelse exist predicate xs'

val hasZero = exist (fn x => x = 0)

val removeZeros = List.filter(fn x => x <> 0)

fun test1 xs =  List.map(fn x => (x, 1)) xs