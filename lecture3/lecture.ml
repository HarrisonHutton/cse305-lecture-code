(*
  Every value has a type and so does every expression
*)

(*
  Concatenate a string with another primitive type with code similar to this:
*)
print_string ("hello" ^ (string_of_int 1));;

(*
  Binding values to variables:
*)

let x = 3

let add_three (y: int) : int = 
  y + x

(*
  New variable that has the same name as an earlier variable; original x does not get removed;
  the add_three function will rely on the x=3 variable; the add_four function will rely on
  the x=4 variable.
*)
let x = 4

let add_four (y: int) : int = 
  y + x