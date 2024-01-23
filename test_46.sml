fun fold (f, acc, xs) =
    case xs of
        [] => acc
    |   x::xs' => fold(f, f(acc, x), xs')

val a = fold(fn (acc, x) => acc + x , 0, [1, 2, 3, 4, 5]);
val b = fold(fn (acc, x) => acc @ [x + 1], [], [1, 2, 3, 4, 5]);

fun compose(f, g) = fn x => f(g x)

fun sqrt_of_abs i = Math.sqrt (Real.fromInt (abs i))
(* fun sqrt_of_abs i = Math.sqrt o Real.fromInt o abs i
val sqrt_of_abs  = Math.sqrt o Real.fromInt o abs *)
infix !>
fun x !> f = f x

fun sqrt_of_abs i  = i !> abs !> Real.fromInt !> Math.sqrt


fun backup1(f, g) = fn x =>
    case f x of
        NONE => g x
    |   SOME y => y

val sorted3 = fn x => fn y => fn z => z >= y andalso y >= x;

val t2 = ((sorted3 7) 9) 11
val t2 = sorted3 7 9 11


fun sorted4 x y z = z >= y andalso y >= x;
val t3 = sorted4 7 9 11