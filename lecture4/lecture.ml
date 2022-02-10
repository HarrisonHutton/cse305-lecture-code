let f x = 
  match x with 
  | (a,b) -> a + b;;

(*
  Functions f and g are exactly the same, with g using Ocaml's syntactic sugar.
*)

let g (a,b) = a + b;;

(*
  -------- LISTS --------
  Inductive data type
*)

(*
  Empty list: []
  Inductive part:
    v::vs
    - v: a value v (head)
    - vs: shorter list of values vs (tail)
*)

(*
  To construct a list, start with an empty list... 
  Ex) 2 :: 3 :: 5 :: []
  "::" called "cons"

  Alternate syntax:
    [2;3;5]
    If confused, fall back on the two basic _constructors_: "::", "[]"
*)

(*
  Concatenating lists...
*)

let a = [1;2] in 
  let b = 3 :: a in 
  4 :: b;;

let c = [1;2;3;4];;

(* Error here because we're trying to put a hold list at the head of another one,
  rather than adding all elements individually. *)
(* let e = c :: e;; *)

(* This is fine. *)

let e = [1;2;3;4]@c;;

(* Analyzing lists *)
(* return Some v, if v is the first list element; 
  return None, if the list is empty *)
let head (xs : int list) : int option =
  match xs with 
  | [] -> None
  | hd :: _ -> Some hd;;

(*
  Given a list of pairs of integers, produce the list of products of the pairs

  Ex) prods [(2,3); (4,7); (5,2)] == [6; 28; 10]
*)
let rec prods (xs : (int * int) list) : int list =
  match xs with 
  | [] -> []
  | (x,y)::ls -> 
    let prod = x * y in 
      prod :: prods ls;;


let y = Some (Some 1) in 
  match y with 
  | None -> false 
  | Some x -> 
    match x with 
    | None -> false 
    | Some z -> true;;

(*
  y computation in a more idiomatic way...
*)

let y = Some (Some 1) in 
  match y with 
  | None -> false 
  | Some (Some x) -> true 
  | Some (None) -> false;;


(* More list pattern-matching *)
let example = [1;2;3] in 
  match example with 
  | [] -> 0
  | x :: xs -> x;;