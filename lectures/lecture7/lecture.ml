let munge (b: bool) (x: int) = 
  if not b then 
    string_of_int x 
  else 
    "hello";;

let y = 17;;

munge (y > 17);;

let rec sum (xs: int list) : int = 
  match xs with 
  | [] -> 0
  | hd::tl -> hd + (sum tl);;


let rec prod (xs: int list) : int = 
  match xs with 
  | [] -> 1
  | hd::tl -> hd * (prod tl);;


(* Exactly the same as fold *)
let rec reduce (f: int -> int -> int) (b: int) (xs: int list) : int =
  match xs with 
  | [] -> b 
  | hd::tl -> f hd (reduce f b tl);;


let xs = [1;2;3;4];;

let sum xs = reduce (fun x y -> x+y) 0 xs;;


(* The following two declarations are equivalent *)
let add = (fun x y -> x + y);;  (* Curried form *)            (* These two are better *)
let add = (fun x -> (fun y -> x + y));; (* Curried form *)    (*          ||          *)
let add (x, y) = x + y;;  (* Uncurried *)


(* The benfit of currying functions is that it allows for partial application *)
