(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

fun all_except_option(s: string, arr: string list) =
    let
        fun contains(s, arr1) =
            case arr1 of
                [] => false
            |   x::xs' =>
                if same_string(x, s)
                then true
                else contains(s, xs')

        fun filter_not(s, arr1) =
            case arr1 of
                [] => []
            |   x::xs' =>
                if same_string(x, s)
                then filter_not(s, xs')
                else x::filter_not(s, xs')
    in
        if contains(s, arr) = false
        then NONE
        else SOME(filter_not(s, arr))
    end

fun get_substitutions1(arr: string list list, s: string) =
    case arr of
        [] => []
    |   x::xs' =>
        let
            val sub_res = all_except_option(s, x);
            val rest_res = get_substitutions1(xs', s);
        in
            case sub_res of
                NONE => rest_res
            |   SOME(t) => t @ rest_res
        end

fun get_substitutions2(arr: string list list, s: string) =
    case arr of
        [] => []
        | x::xs' =>
            case all_except_option(s, x) of
                NONE => get_substitutions1(xs', s)
            |   SOME(t) => t @ get_substitutions1(xs', s)

fun similar_names(names: string list list, {first = ft,middle =  md,last = lt}) =
    let
        fun map(f, xs: 'a list) =
            case xs of
                [] => []
            |   x::xs' => f(x)::map(f, xs')

        fun convert(s: string) = {first =  s,middle = md,last = lt}

        val arr = get_substitutions2(names, ft);
    in
        convert(ft)::map(convert, arr)
    end



(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw

exception IllegalMove

(* put your solutions for problem 2 here *)
fun card_color(s ,_) =
    case s of
        (Spades | Clubs) => Black
       | (Diamonds | Hearts) => Red

fun card_value(_ , r) =
    case r of
        Num i => i
       | Ace => 11
       | _ => 10

fun remove_card(cs: card list , (s1, r1), e: exn) =
    let fun aux(cs1: card list, acc) =
            case cs1 of
                [] => raise e
            | x::xs =>
                    case x of
                        (s2, r2) =>
                            if s1 = s2 andalso r2 = r1
                            then acc @ xs
                            else aux(xs, x::acc)

    in
        aux(cs, [])
    end

(* all_same_color [(Hearts, Ace), (Diamonds, Ace)] *)
fun all_same_color(cs: card list) =
    let fun aux(cs: card list, c: color) =
        case cs of
            [] => true
        |   x::cs' =>
            if card_color(x) = c
            then aux(cs', c)
            else false
    in
        case cs of
            []  => true
         | x::[]  => true
         | x::cs' => aux(cs', card_color(x))
    end


(* sum_cards [(Hearts, Ace), (Diamonds, Ace) ,(Clubs, Num 2),(Clubs, Num 2) ] *)
fun sum_cards(cs: card list) =
    let fun aux(cs1:card list, acc) =
            case cs1 of
                [] => acc
            |   x::cs' => aux(cs', acc + card_value(x))
    in
        aux(cs, 0)
    end

(* score ([(Hearts, Num 2),(Clubs, Num 4)],10) -> 6  *)
fun score(cs: card list, s: int) =
    let
        val sum = sum_cards(cs);
        val is_same = all_same_color(cs);
    in
        if sum >= s
        then
            let val res = sum - s;
            in
            if is_same then res div 2 else res
            end
        else
            let val res =  s - sum;
            in
            if is_same then res div 2 else res
            end
    end

fun officiate(cs: card list, ml: move list, s: int) =
    let fun run_game(cs1: card list, ml1: move list, acc: card list) =
            case (cs1, ml1) of
                ([], _) => acc
            |   (_, []) => acc
            |   (c::cs1', m::ml1') =>
                    case m of
                        Draw =>
                            let
                                val cur = c::acc;
                                val s1 = score(cur, s)
                            in
                                if s1 > s then cur else run_game(cs1', ml1', c::acc)
                            end
                    |   Discard c2 => run_game(cs1, ml1', remove_card(acc, c2, IllegalMove))
         val res = run_game(cs, ml, [])
         val s3 = score(res, s)
    in
        s3
    end