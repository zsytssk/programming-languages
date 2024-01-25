fun sum_triple1 triple =
    case triple of
        (x, y, z) => x + y + z

fun sum_triple2 triple =
    let val (x, y, z) = triple
    in
        x + y + z
    end

fun sum_triple3 (x, y, z) =
    x + y + z

fun full_name1 r =
    case r of
        {first=x, middle=y, last=z} =>
            x ^ " " ^ y ^ " " ^ z ^ " "

fun full_name2 r =
    let  val {fiirst=x, middle=y, last=z} = r
    in
        x ^ " " ^ y ^ " " ^ z ^ " "
    end

fun full_name3 {first=x, middle=y, last=z} =
    x ^ " " ^ y ^ " " ^ z ^ " "

val (x, ..., y) = (1, 2 , 4, 3);