
datatype 'a inflist = NIL
                    | CONS of 'a * (unit -> 'a inflist);
fun HD (CONS(a,b)) = a
  | HD NIL = raise Subscript;
fun TL (CONS(a,b)) = b()
  | TL NIL = raise Subscript;
fun NULL NIL = true
  | NULL _ = false;
(* take first n elements as a sublist *)
fun TAKE(xs, 0) = []
  | TAKE(NIL, n) = raise Subscript
  | TAKE(CONS(x,xf), n) = x::TAKE(xf(), n-1);

fun tri n = CONS(((n*(n+1)) div 2), fn () => tri (n+1));
val infTri = tri 1;