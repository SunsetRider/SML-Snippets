(* Author: Yongsheng Song
 * E-mail: ysong26@buffalo.edu
 *)

CM.make "$cml/cml.cm";
open CML;

val chan1: int chan = channel(); (* sender1 -> sender2 *)
val chan2: int chan = channel(); (* sender2 -> sender1 *)
val chan3: int chan = channel(); (* sender2 -> receiver *)

fun sender1 x n = if n = 1
				  then send(chan1, x)
				  else (send(chan1, x);
					    let val xr = recv(chan2)
					    in sender1 xr (n-1)
				  		end)

fun sender2 x = let val xr = recv(chan1)
	            in send(chan3, xr); 
	               send(chan2, (x+xr));
	               sender2 xr
	            end

fun receiver () = (TextIO.print(Int.toString(recv chan3)^"\n"); receiver());

fun main () = (spawn (fn () => sender1 0 43);
			   spawn (fn () => sender2 1);
			   spawn receiver;());

RunCML.doit(main, NONE);
