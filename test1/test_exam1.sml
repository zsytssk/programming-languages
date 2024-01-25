
fun is_older (d1: int * int * int, d2: int * int * int) =
    if (#1 d1) < (#1 d2)
    then true
    else if (#1 d1) = (#1 d2) andalso (#2 d1) < (#2 d2)
    then true
    else if (#1 d1) = (#1 d2) andalso (#2 d1) = (#2 d2) andalso (#3 d1) < (#3 d2)
    then true
    else false

fun number_in_month(dates: (int*int*int) list, month: int) =
    if null dates
    then 0
    else if (#2 (hd dates)) = month
    then 1 + number_in_month(tl dates, month)
    else number_in_month(tl dates, month)

fun number_in_months(dates: (int*int*int) list, months: int list) =
    if null months
    then 0
    else
        let
            val n1 = number_in_month(dates, hd months);
        in
            n1 + number_in_months(dates, tl months)
        end

fun dates_in_month(dates: (int*int*int) list, month: int) =
    if null dates
    then []
    else if (#2 (hd dates)) = month
    then (hd dates)::dates_in_month(tl dates, month)
    else dates_in_month(tl dates, month)



fun dates_in_months(dates: (int*int*int) list, months: int list) =
    if null months
    then []
    else
        let
            fun append(xs: (int*int*int) list, ys: (int*int*int) list) =
                if null xs
                then ys
                else (hd xs)::append((tl xs), ys)

            val n1 = dates_in_month(dates, hd months);
        in
            append(n1, dates_in_months(dates, tl months))
        end

fun get_nth(strs: string list, index: int) =
    if index = 1
    then hd strs
    else get_nth(tl strs, index - 1)


fun date_to_string(date: (int*int*int)) =
    let
        val month_name = ["January", "February", "March", "April",
"May", "June", "July", "August", "September", "October", "November", "December"]
    in
        get_nth(month_name, #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
    end

fun number_before_reaching_sum(num: int, nums: int list) =
    if num - (hd nums) <= hd (tl nums)
    then hd nums
    else number_before_reaching_sum(num - (hd nums), tl nums)

fun what_month(num: int) =
    let
        fun index_in_year(num: int, nums: int list, index: int) =
            if num <= hd nums
            then index
            else index_in_year(num - (hd nums), tl nums, index + 1)
        val month_days = [31, 28, 31, 30, 31, 30,31, 31, 30,  31, 30, 31]
    in
        index_in_year(num, month_days, 1)
    end

fun month_range(d1: int, d2: int) =
    let
        fun countup(from: int, to: int, rest: int) =
            if rest = 0
            then []
            else if from = to
            then to::countup(to, to, rest - 1)
            else from::countup(from + 1, to, rest - 1)
        val n1 = what_month(d1);
        val n2 = what_month(d2);
    in
        (* [n1, n2, n2 - n1] *)
        if d1 > d2
        then []
        else countup(n1, n2, d2 - d1  + 1)
    end

fun oldest(ds: (int * int * int) list) =
    if null ds
    then NONE
    else
        let
            val h1 = hd ds;
            val rest_old = oldest(tl ds);
        in
            if isSome rest_old andalso is_older(valOf(rest_old), h1)
            then rest_old
            else SOME(h1)
        end

fun contains(n: int, ins: int list) =
    if null ins
    then false
    else if n = hd ins
    then true
    else contains(n, tl ins)

fun remove_dupl(s: int list) =
    if null s
    then []
    else if contains(hd s,tl s)
    then remove_dupl(tl s)
    else hd s::remove_dupl(tl s)

fun reasonable_date