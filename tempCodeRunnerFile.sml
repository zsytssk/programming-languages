val a = NONE;

fun max1(xs: int list) =
    if null xs
    then NONE
    else
        let val rest_max = max1(tl xs)
        in
            if isSome rest_max andalso valOf rest_max > hd xs
            then rest_max
            else SOME(hd xs)
        end

max1([1, 2, 3, 4, 5, 6])