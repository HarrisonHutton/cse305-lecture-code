(* The following two functions are almost identical *)
let rec inc_all (xs: int list) : int list = 
  match xs with 
  | [] -> []
  | hd::tl -> (hd + 1) :: (inc_all tl);;

  
let rec square_all (xs: int list) : int list = 
  match xs with 
  | [] -> []
  | hd::tl -> (hd*hd)::(square_all tl);;

(*
  Want to factor out common behavior!
*)

(* A higher-order function captures the recursion pattern *)
(* Very clean abstraction mechanism *)
let rec map (f: int->int) (xs: int list) : int list = 
  match xs with 
  | [] -> []
  | hd::tl -> (f hd)::(map f tl);;

let inc (x: int) : int = 
  x + 1;;

let square (x: int) : int = 
  x * x;;


(* Now use map *)
let inc_all xs = map inc xs;;


(* Writing functions like inc are a pain *)

(* Functions don't need to have a name! *)

(* ---> Anonymous functions! Lambda calculus! *)

let inc_all xs = map (fun x -> x + 1) xs;;

let square_all xs = map (fun y -> y * y) xs;;


(* POLYMORPHISM *)

(* 
  Revisiting map, it will only work ints....
  What if we want to use it on a list of floats?
*)

(* Removing type annotations allows map to work with any type --> anpnymous functions *)

let rec map (f: 'a -> 'b) (xs: 'a list) : 'b list = 
  match xs with
  | [] -> []
  | hd::tl -> (f hd)::(map f tl);;

(* 
  Type of map:   
  ('a -> 'b) -> 'a list -> 'b list   
*)

let ints = map (fun x -> x + 1) [1;2;3];;
let floats = map (fun x -> x +. 2.0) [1.;2.;3.];;
let strings = map String.uppercase_ascii ["sarah"; "joe"];;


let rec fold_left (f: 'a -> 'b -> 'a) (z: 'a) (xs: 'b list) : 'a = 
  match xs with 
  | [] -> z
  | hd::tl ->
    fold_left f (f z hd) tl;;
    
(* 
  Example fold_left call:
  fold_left (+) 0 [1;2;3;4;5];;
  ---> int: 15
*)

let rec fold_right (f: 'a -> 'b -> 'b) (xs: 'a list) (z: 'b) : 'b = 
  match xs with 
  | [] -> z 
  | hd::tl ->
    f hd (fold_right f tl z);;
    