print_string "Hello CSE305\n";;

(*
Use this program in top level by running this command:

  #use "lecture.ml";;
*)

let rec sumTo (n:int) : int =
  match n with
  | 0 -> 0
  | n -> n + sumTo (n-1)

let _ =
  print_int (sumTo 8);
  print_newline()