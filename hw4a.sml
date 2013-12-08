(* Author: Yongsheng Song
 * E-mail: ysong26@buffalo.edu
 *)

CM.make "$cml/cml.cm";
open CML;

val chan: int chan = channel();

(* send the numbers *)
fun sender 100 = send(chan, 100)
  | sender x = (send(chan, x); sender(x+1));

(* receirve the numbers *)
fun receiver () = (TextIO.print(Int.toString(recv chan)^"\n"); receiver());

fun main () = (spawn receiver; spawn (fn () => sender 0); ());

RunCML.doit(main, NONE);
