(* Author: Yongsheng Song
 * E-mail: ysong26@buffalo.edu
 *)

CM.make "$cml/cml.cm";
open CML;

fun mailbox inCh outCh l = let fun loop nil =
            						          	let val xr = recv(inCh)
                    						    in loop(xr :: nil)
            									      end
                							   | loop l   = 
                							   		select [
                							          wrap (recvEvt(inCh),
                							  			  fn x => loop (l@[x])),
                							  		    wrap (sendEvt(outCh, hd l),
                							  			  fn () => loop(tl l))];
                						in loop l
                						end

fun receiver chan = (TextIO.print(Int.toString(recv chan)^"\n"); receiver chan);

fun sender chan n = if n = 0
                    then send(chan, 0)
                    else (send(chan, n); sender chan (n-1));

fun generator chStart chEnd n = if n = 1
                                then (spawn(fn () => mailbox chStart chEnd nil); chEnd)
                                else (spawn(fn () => mailbox chStart chEnd nil); 
                                     generator chEnd (channel()) (n-1));

fun main () =
  let val chStart = channel()
      val chEnd = generator chStart (channel()) 100
      val _ = spawn (fn () => receiver chEnd)
      val _ = spawn (fn () => ignore (sender chStart 50))
      val _ = spawn (fn () => ignore (sender chStart 50))
  in ()
  end;

RunCML.doit(main, NONE);
