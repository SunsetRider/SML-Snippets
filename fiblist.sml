(* generate a fibonacci list of size n *)
fun fiblist 0 = []
  | fiblist n = let
                    fun fib 1 = 0
                      | fib 2 = 1
                      | fib n = fib(n-1) + fib(n-2);
                in  
                    fiblist(n-1) @ [(fib n)] 
                end
                 