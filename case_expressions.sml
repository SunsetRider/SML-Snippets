datatype myType = TWOINTS of int * int
				| STR of string
				| PIZZA

(* myType -> int *)
fun f (x : myType) =
	case  x of
		PIZZA => 3
		| STR s => 8
		| TWOINTS(i1, i2) => i1 + i2

(*      | PIZZA => 4; (* redundant case: error *) *)
(* fun g x = case x of PIZZA => 3 (* missing case: warning *) *)