fun same_string (s1 : string, s2 : string) =
    s1 = s2

fun all_except_option (str, xs) =
	case xs of 
    	 [] => NONE 
       | (x::xs') => case (same_string(str,x)) of 
               			  true => SOME xs' 
            			| false => case all_except_option(str,xs') of 
                   						NONE => NONE 
                    				  | SOME xs'' => SOME (x::xs'') 

fun t x = let fun loop nil = loop(1::nil)
                | loop l   = fn l => hd l
          in loop nil
          end
