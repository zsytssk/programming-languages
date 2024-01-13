exception ListLenthMismatch;

fun zip3(xs) =
    case xs of
        ([], [], []) => []
        | (hd1::tl1, hd2::tl2,  hd3::tl3) => (hd1, hd2, hd3)::zip3(tl1, tl2, tl3)
        | _ => raise ListLenthMismatch

fun unzip3(xs) =
    case xs of
        [] => ([], [], [])
        | (a, b, c)::xs' =>
            let val  (l1, l2, l3) = unzip3(xs')
            in
                (a::l1, b::l2, c::l3)
            end

fun nondescreasing xs =
    case xs of
        [] => true
      | _::[] => true
      | h1::(h2::rest) => h1 <= h2 andalso nondescreasing(h2::rest)

datatype sgn = P | N | Z

fun sign1 x =
    case x of
        x > 0 => P
    |   x < 0 => N
    |   _ => Z

fun multsign(x1, x2)=
    let fun sign x = if x = 0 then Z else if x > 0 then P else N
    in
        case (sign x1, sign x2) of
            (Z, _) => Z
          | (_, Z) => Z
          | (P, P) => P
          | (N, N) => P
          | _ => N
    end

fun len x =
    case x of
        [] => 0
       | _::x' => 1+ len x'