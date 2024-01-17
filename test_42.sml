fun double x = 2 * x
fun incr x = x + 1

fun triple x = 3 * x
val triple2 = fn x => 3 * x


fun n_times(f, n, x) =
    if n =0
    then x
    else f (n_times(f, n-1,x))


val a = n_times(incr, 10, 5);
val b = n_times(double, 10, 5);

fun addition(n, x) = n_times(incr, n, x);
fun double_n_times(n, x) = n_times(double, n, x);
fun tail_n_times(n, x) = n_times(tl, n, x);

fun triple_n_times1(n, x) = n_times(triple, n, x);
fun triple_n_times2(n, x) =
    n_times(fn x => 3 * x, n, x)

