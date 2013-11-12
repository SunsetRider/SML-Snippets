(*
 * Author: Yongsheng Song
 * E-mail: ysong26@buffalo.edu
 *)


(* define the infinite list *)
datatype 'a inflist = NIL
                    | CONS of 'a * (unit -> 'a inflist);

(* get head of the list *)
fun HD (CONS(a,b)) = a
  | HD NIL = raise Subscript; (* throw exception *)

(* get tail of the list *)
fun TL (CONS(a,b)) = b()
  | TL NIL = raise Subscript;

(* validate whether the list is nil *)
fun NULL NIL = true
  | NULL _ = false;

(* filter the infinite list using rules defined in f *)
fun FILTER f l = if NULL l
                 then NIL
                 else if f (HD l)
                      then CONS(HD l, fn () => 
                                         (FILTER f (TL l)))
                      else FILTER f (TL l);

(* take first n elements as a sublist *)
fun TAKE(xs, 0) = []
  | TAKE(NIL, n) = raise Subscript
  | TAKE(CONS(x,xf), n) = x::TAKE(xf(), n-1);

(* test the argument if it is even *)
fun even x = x mod 2 = 0

(* test the argument if it is odd *)
fun odd x = x mod 2 <> 0

(* generate an infinite list containing the Fibonacci sequence 
  start from x y *)
fun fib x y = CONS(x, fn () => fib y (x+y))

(* the entire Fibonacci sequence *)
val fibs = fib 0 1;

(* generate an infinite list that only has the even numbers *)
val evenFibs = FILTER even fibs;

(* generate an infinite list that only has the odd numbers *)
val oddFibs = FILTER odd fibs;

(* applies the function f to each element of the list l *)
fun printGenList f l = if null l
                       then () 
                       else (f(hd l);
                             printGenList f (tl l))

(* print the element of the list and then a space character *)
fun printList l = let
                      fun f e = print (Int.toString (e) ^ " ")
                  in
                      printGenList f l
                  end

(* print an open parenthesis the first element of the pair,
 a comma, a space, the second element of the pair,
 and then a close parenthesis *)
fun printPairList l = let
                           fun f (e : int*int) = print ("(" ^ Int.toString (#1 e) ^ 
                                                        ", " ^ Int.toString(#2 e) ^ ") ")
                      in
                           printGenList f l
                      end

(* zip together two infinite lists *)
fun ZIP (NIL, _) = NIL
  | ZIP (_, NIL) = NIL
  | ZIP (CONS(h1,t1), CONS(h2,t2)) = CONS( (h1,h2), fn () => ZIP(t1(),t2()));

(* test *)
printList (TAKE (fibs, 20));
printList (TAKE (evenFibs, 10));
printList (TAKE (oddFibs, 10));
printPairList (TAKE (ZIP (evenFibs, oddFibs) , 10));