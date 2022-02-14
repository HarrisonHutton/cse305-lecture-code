(*
  Note: Recursive functions must begin with "let rec"
*)

let add_one (x: int) : int =
  x + 1

(*
  Tuples do not need to be homogenous!
*)

let tuple = ("hello", 7 + 3, true);;

(*
  Accessing elements in a tuple:
  use pattern matching
*)

let (x,y) = (2,4) in x + x + y;;


let add_pair (pair: int * int) : int =
  let (x,y) = pair in 
    x + y;;


(*
  Options:
  Representation of any type in an expression
*)


(*
  Slope between two points:
*)

type point = float * float 

let slope (p1: point) (p2: point) : float option =
  (* Deconstruct tuple *)
  let (x1,y1) = p1 in 
  let (x2,y2) = p2 in 
  let xd = x2 -. x1 in 

  (* Handle division by zero *)
  if xd != 0.0 then 
    Some ((y2 -. y1) /. xd)
  else
    None;;


let print_slope (p1: point) (p2: point) : unit =
  match slope p1 p2 with 
  | Some float -> print_string ("Slope: " ^ string_of_float float ^ "\n")
  | None -> print_string "Vertical line.\n";;