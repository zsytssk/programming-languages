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


fun count_wild_and_variable_lengths (p) =
    let
        fun check_wild () = 1
        fun check_val (x) = String.size(x)
        val calc = g check_wild check_val
    in
        calc p
    end

val p1 = ConstructorP ("t", ConstructorP ("s", TupleP [Wildcard, Wildcard, Variable("i")]))
val test9b = count_wild_and_variable_lengths (p1)