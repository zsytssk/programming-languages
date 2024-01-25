fun silly1 (z: int) =
    let
      val x = 1
    in
      x
    end

fun silly2 (z: int) =
    let
      val x = 1
    in
      (let val x = 2 in x + 1 end) + (let val y = x + 2 in y + 1 end)
    end

fun count_from1(x:int) =
    let
        fun count(from:int) =
            if from = x
            then x::[]
            else
                from::count(from+1)
    in
        count(1)
    end

fun countup(from: int, to: int) =
    if from = to
    then to::[]
    else from::countup(from + 1, to)

fun bad_max1(xs: int list) =
    if null xs
    then 0
    else if null (tl xs)
    then hd xs
    else if hd xs > bad_max1(tl xs)
    then hd xs
    else bad_max1(tl xs)

fun max2(xs: int list) =
    if null xs
    then 0
    else
        let val rest_max = max2(tl xs)
        in
            if hd xs > rest_max
            then hd xs
            else rest_max
        end
