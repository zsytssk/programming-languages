(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let
	val r = g f1 f2
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)

fun only_capitals (xs: string list) =
    let
        fun aux x =
            let
                val c = String.sub(x, 0)
            in
                Char.isUpper(c)
            end
    in
        List.filter aux xs
    end

val test1 = only_capitals ["Add", "A","B","C"] = ["A","B","C"];

fun longest_string1 xs =
    let
        fun aux(acc, x) =
        let
            val sx = String.size x
            val sa = String.size acc
        in
            if sx > sa
            then x
            else acc
        end
       val rt = List.foldl aux "" xs
    in
      rt
    end

fun longest_string2 xs =
    let
        fun aux(acc, x) =
        let
            val sx = String.size x
            val sa = String.size acc
        in
            if sx > sa
            then x
            else acc
        end
       val rt = List.foldr aux "" xs
    in
      rt
    end

val test2 = longest_string1 ["A","bc","C"] = "bc"
val test3 = longest_string2 ["bc","bc","C"] = "bc"
(* 下面代码怎么不行
 fun longest_string1 xs =
    let
        fun aux((acc, sa), x) =
        let
            val sx = String.size x
        in
            if sx > sa
            then (x, sx)
            else (acc, sa)
        end
       val rt = List.foldl aux, ("", 0), xs;
    in
      (#1 rt)
    end *)

fun longest_string_helper f xs =
    let
        fun aux(acc, x) =
        let
            val sx = String.size x
            val sa = String.size acc
        in
            if f(sx, sa)
            then x
            else acc
        end
       val rt = List.foldr aux "" xs
    in
      rt
    end

fun longest_string3 xs =
    let
        fun aux(n1, n2) =
            n1 > n2
    in
      longest_string_helper aux xs
    end

fun longest_string4 xs =
    let
        fun aux(n1, n2) =
            n1 > n2 orelse n1 = n2
    in
        longest_string_helper aux xs
    end

val test3 = longest_string3 ["A","bc","aC"] = "bc"
val test4 = longest_string4 ["A","bc","aC"] = "aC"

fun longest_capitalized xs =
    let
        val xs' = only_capitals xs;
    in
        longest_string3( xs')
    end

val test5 = longest_capitalized ["A","Abc","C"] = "Abc"

fun rev_string s =
    let
        val n = String.size s
        fun str_to_arr i =
            if i = n
            then []
            else String.sub(s, i)::str_to_arr(i + 1)

        fun arr_to_str(xs, acc) =
            case xs of
                [] => acc
            |   x::xs' => arr_to_str(xs', acc ^ String.str(x))
        val arr1 = str_to_arr 0
        val rarr = List.rev arr1
        val arr2 = arr_to_str(rarr,"")
    in
        arr2
    end

val test6 = rev_string "abc"
(* val test6 = rev_string "abc" = "cba"; *)


fun first_answer f xs =
    case xs of
        [] => raise NoAnswer
    |   x::xs' =>
        case f(x) of
            SOME x => x
        |   None => first_answer f xs'

val test7 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4
val test7_1 = (first_answer (fn x => if x > 10 then SOME x else NONE) [1,2,3,4,5]) handle NoAnswer => 10

(* 下面的为什么会报错
fun first_answer f xs =
    ...
           None => first_answer f xs'
        |    SOME x => x
 *)

fun all_answers f xs =
    let
        fun aux (xs', acc) =
            case xs' of
                [] => acc
            |   x::xs'' =>
                case f(x) of
                    SOME x => aux(xs'', acc @ x)
                |   None => aux(xs'', acc)
        val res = aux(xs, [])
    in
        case res of
            [] => NONE
        |    xs => SOME(xs)
    end

val test8 = all_answers (fn x => if x > 3 andalso x < 7 then SOME [x] else NONE) [2,3,4,5,6,7] = [4, 5, 6]
