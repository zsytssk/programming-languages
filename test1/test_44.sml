fun map (f, xs) =
    case xs of
        [] => []
    |   x::xs' => (f x)::map(f, xs')

val x1 = map(fn x => x + 1, [1, 2, 3]);
val x2 = map(hd, [[1,2], [3, 4], [5, 6]]);


fun filter (f, xs) =
    case xs of
        [] => []
    |   x::xs' =>
            if (f x)
            then x::filter(f, xs')
            else filter(f, xs')

fun is_even v =
    (v mod 2 = 0)

val x3 = filter(fn x => x > 2, [1, 2, 3]);

fun all_even xs = filter(is_even, xs)

val x4 = all_even([1, 2, 3, 4, 5, 6]);


fun find (f, xs) =
    let fun aux(arr, acc) =
            case arr of
                [] => NONE
            |   x::xs' =>
                    if (f (x, acc))
                    then SOME(x)
                    else aux(xs', acc + 1)
    in
        aux(xs, 0)
    end

fun find_index (f, xs) =
    let fun aux(arr, acc) =
            case arr of
                [] => ~1
            |   x::xs' =>
                    if (f (x, acc))
                    then acc
                    else aux(xs', acc + 1)
    in
        aux(xs, 0)
    end

val x5 = find(fn (x,i) => i = 4, [1, 2, 3, 4, 5, 6]);


fun find_index (f, xs) =
    let fun aux(arr, acc) =
            case arr of
                [] => ~1
            |   x::xs' =>
                    if (f (x, acc))
                    then acc
                    else aux(xs', acc + 1)
    in
        aux(xs, 0)
    end

val x6 = find_index(fn (x,_) => x = 6, [1, 2, 3, 4, 5, 6]);