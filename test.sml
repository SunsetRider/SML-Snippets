fun extract_Bools nil = nil
  | extract_Bools ((_,x)::xs) = let
                 val  Boolists = x::extract_Bools(xs)
                 val Len = length(Boolists)
             in
                 List.tabulate(Len,fn i => map (fn Boolists =>     (List.nth(Boolists,i))) Boolists)
             end;