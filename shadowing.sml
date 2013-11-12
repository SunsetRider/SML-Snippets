(* Example to Demonstrate Shadowing *)

val a = 10
(* a : int 
   a -> 10 *)

val b = a * 2
(* a -> 10
   b -> 20 *)

val a = 5 (* this is not an assignment statement *)
(* a -> 5, b -> 20 *)

val c = b
(* ..., d -> 5 *)

val a = a + 1
(* ..., a -> 6 *)
(* val g = f - 3 *)

val f = a * 2
(* f -> 12 *)