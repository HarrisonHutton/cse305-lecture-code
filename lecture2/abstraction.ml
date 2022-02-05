(*
  Will "return" 25
*)
let x = 2 + 3 in
  x * x;;

(*
  Will "return" 32
*)
let y = 2 in
  let squared = y * y in 
    let cubed = y * squared in 
      cubed * squared;;