val x = 7;

fun pow(x: int, y: int) =
    if y = 0
    then 1
    else x * pow(x, y - 1)
fun cube (x: int) =
    pow(x, 3)
val sixyfour = cube(4)
val fortytwo = pow(2, 2+ 2) + pow(4, 2) + cube(2) + 2

fun swap(pr: int * bool) =
    (#2 pr, #1 pr)

fun sum_two_pairs(pr1: int * int, pr2: int * int) =
    (#1 pr1) + (#2 pr1) + (#1 pr2) + (#2 pr2)

fun div_mod(x: int, y: int) =
    (x div y, x mod y)

fun sort_pair(pr: int * int) =
    if (#1 pr) < (#2 pr)
    then pr
    else (#2 pr, #1 pr)

val x1 = (7, (true, 9))
val x2 = #1 (#2 x1)
val x3 = (#2 x1)
val x4 = ((3, 5), ((4, 8), (0, 0)))

val y = ((4, (5, 6)) , (3, (5, 6)))
val z = ((3, (5, 6)), 4)

