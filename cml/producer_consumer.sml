(* producer and consumer *)
CM.make "$cml/cml.cm";
open CML;



fun producer ch =
  let fun loop x = (send(ch, x); loop (x+1))
  in spawn (fn () => loop 0)
  end

fun receiver ch =
  let fun loop () = (TextIO.print(Int.toString(recv ch)^"\n"); loop ())
  in spawn loop 
  end

fun main () = 
    let 
        val ch : int chan = channel()
        val _ = spawn(fn () => ignore (producer ch))
        val _ = spawn(fn () => ignore (receiver ch))
    in
        ()
    end;

RunCML.doit(main, NONE);