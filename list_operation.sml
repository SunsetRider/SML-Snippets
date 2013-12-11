(* get the length of a list *)
fun getLength nil = 0
  | getLength list = let
                        fun len ([], n) = n
                          | len (l, n) = len((tl l), n+1);
                     in  
                        len(list, 0)
                     end

(* reverse the list *)
fun reverse nil = nil
  | reverse (h::t) =  reverse(t) @ [h];

(* get the last element of the list *)
fun getLast nil = raise Subscript
  | getLast (h::nil) = h
  | getLast (h::t) = getLast(t)
