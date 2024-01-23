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

fun count_wildcards (p) =
    let
        fun is_one () = 1
        fun is_zero (x) = 0
        val calc = g is_one is_zero
    in
        calc p
    end

val p = ConstructorP ("t", ConstructorP ("s", TupleP [Wildcard, Wildcard, UnitP]))

val test9a = count_wildcards Wildcard = 1
val test9a1 = count_wildcards p = 2


fun count_wild_and_variable_lengths(p) =
    let
        fun check_wild () = 1
        fun check_val (x) = String.size(x)
        val calc = g check_wild check_val
    in
        calc p
    end

val p1 = ConstructorP ("t", ConstructorP ("s", TupleP [Wildcard, Wildcard, Variable("i")]))
val test9b = count_wild_and_variable_lengths (p1)

fun count_some_var(s, p) =
    let
        fun check_wild () = 0
        fun check_val (x) =
            if x = s
            then 1
            else 0
        val calc = g check_wild check_val
    in
        calc p
    end

val p2 = ConstructorP ("t", ConstructorP ("s", TupleP [Wildcard, Variable("x"), Variable("x")]))
val test9c = count_some_var ("x", p2)

fun check_pat(p) =
    let
        fun get_vars(acc, p) =
            case p of
              Variable x        => x::acc
            | TupleP ps         => List.foldl (fn (p,i) => get_vars(acc, p) @ i) [] ps
            | ConstructorP(_, p) => get_vars(acc, p)
            | _                 => []

        fun has_repeat(xs) =
            case xs of
                [] => true
            |   x::xs' =>
                if List.exists(fn s => s = x) xs'
                then false
                else has_repeat(xs')

        val lv = get_vars([], p)
    in
        has_repeat lv
    end

val p3 = ConstructorP ("t", ConstructorP ("s", TupleP [Variable("s"), Variable("x")]))
val test10 = check_pat (p3)

fun match(v, p) =
    let
        fun in_match_pairs(pairs, acc) =
            case pairs of
                [] => SOME(acc)
            |   (vi, pi)::pairs' =>
                    case match(vi, pi) of
                        NONE => NONE
                    |   SOME(x) => in_match_pairs(pairs', x @ acc)

        fun in_match(v', p') =
            case (v', p') of
                (_, Wildcard) => SOME([])
            |   (_, Variable s) => SOME([(s, v')])
            |   (Unit, UnitP) => SOME([])
            |   (Const v1, ConstP p1) =>
                if v1 = p1
                then SOME([])
                else NONE
            |   ( Tuple vs, TupleP ps ) =>
                    if List.length(ps) <> List.length(vs)
                    then NONE
                    else
                        let
                            val pairs = ListPair.zip(vs, ps);
                        in
                           in_match_pairs(pairs, [])
                        end
            |   (Constructor(s2,v1), ConstructorP(s1, p1)) =>
                    if s1 <> s2
                    then NONE
                    else in_match(v1, p1)
            | _ => NONE
    in
        in_match(v, p)
    end


val test11 = match (Const(1), Variable("x"))
val test11_2 = match (Tuple[Const(1), Const(1)], TupleP [Variable("s"), Variable("x")])

fun first_match(v, p) = SOME []