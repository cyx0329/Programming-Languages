(* Author: Yi Cai *)
(* intersperse function takes a value and a list, and return the list 
in which the value is "interspersed" into the given list.*)

(* "_" is any value, "[]" is empty list, "[a]" is a list within 
only one value, "b" is any value, "x" is the head of a list, 
"xs" is the rest of a list.*)

fun intersperse _ [] = []
  | intersperse _ [a] = [a]
  | intersperse b (x::xs)  = x::b ::(intersperse b xs)

(* To load this file, type 
     sml intersperse.sml
   on the command line. Alternatively you can run 
     sml
   first and then type
     use "intersperse.sml" ;
   at the SML prompt. *)