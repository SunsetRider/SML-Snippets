datatype myType = TWOINTS of int * int
				| STR of string
				| PIZZA

val a = STR "hi"
val b = STR
val c = PIZZA
val d = TWOINTS(1+2, 3+4)
val e = a

(* Do _not_ redo datatype bindings (e.g., via use "finlename.sml".
   Doing so will shadow the type name and the constructors.)
datatype myType = TWOINTS of the int * int | STR of string | PIZZA *)