exception MyException of int
fun f n =
    if n=0
    then raise List.Empty
    else if n=1
    then raise (MyException 4)
    else n * n

val x = (f 1 handle List.Empty => 42) handle MyException n => f n

val y = (raise MyException 100) handle MyException n => f n