type date = int * int * int;
datatype  my_init_list = Empty | Cons of int * my_init_list;
val x = Cons(4, Cons(23, Cons(2008, Empty)));

fun append_my_list (xs, ys) =
    case xs of
        Empty => ys
     |  Cons(x, xs') => Cons(x, append_my_list(xs', ys))

val t = append_my_list(x, Cons(5, Empty));