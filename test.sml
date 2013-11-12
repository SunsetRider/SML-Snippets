fun test(l2:string,ls:string list,s1:string) = if String.isSubstring (hd ls) s1 then

                       (TextIO.openOut l2; TextIO.inputLine (hd(ls)), test(l2,tl(ls),s1)) else 

                       test(l2,tl(ls),s1);