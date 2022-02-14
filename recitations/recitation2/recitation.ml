let rec pow (x, y) = 
  if y == 0 then 1 
  else x * pow(x, y-1);;


let cube x = 
  pow(x, 3);;


let munge ((b: bool), (x: int)) : string = 
  if not b then string_of_int x 
  else "Hello";;


let rec reverse ls =
  match ls with 
  | [] -> []
  | hd::tl -> reverse tl @ [hd];;


let rec uppercase str = 
  match str with 
  | [] -> []
  | hd::tl -> (String.uppercase_ascii hd) :: uppercase tl;;


let rec printlist l = 
  match l with 
  | [] -> ()
  | hd::tl -> (print_endline hd; printlist tl);;


let rec zip x = 
  match x with 
  | (h1::t1, h2::t2) -> (h1,h2)::zip(t1,t2)
  | _ -> [];;