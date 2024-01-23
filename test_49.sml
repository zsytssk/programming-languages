val x = ref 42;
val y = ref 42;

val z = x;
x := 43;
val w = (!z) + (!y);

val cbs:(int -> unit) list ref = ref []
fun onKeyEvent f = cbs:= f::(!cbs);
fun onEvent i =
    let fun loop fs =
        case fs of
            [] => ()
        | f::fs' => (f i ; loop fs')
    in loop (!cbs) end

val timesPressed = ref 0;

onKeyEvent(fn _ => timesPressed := (!timesPressed) + 1);

fun printIfPressed i =
    onKeyEvent(fn j =>
        if j = i
        then print ("you pressed " ^ Int.toString i ^ "\n")
        else  ()
    );


printIfPressed(2);

val f1 = List.map;

(* print "hello world" *)