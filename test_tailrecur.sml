fun sum xs =
    let fun aux(xs, acc) =
        case xs of
            [] => acc
        |   x::xs' => aux(xs', x + acc)
    in
        aux (xs, 0)
    end

val a = sum([1, 2, 3, 4]);

fun rev xs =
    let fun aux(xs, acc) =
        case xs of
            [] => acc
        |   x::xs' => aux(xs', x::acc)
    in
        aux (xs, [])
    end

val b = rev([1, 2, 3, 4]);