(* Type _abbreviation_ *)
type il = int list 

(* Insert x into sorted list xs *)
let rec insert (x: int) (xs: il) : il = 
  match xs with 
  | [] -> [x]
  | hd :: tl -> 
    if hd < x then 
      hd :: insert x tl
    else
      (* xs has not changed after the pattern matching because there's no mutation in Ocaml *)
      x :: xs;;

let rec insertion_sort (xs: il) : il = 
  let rec aux (sorted: il) (unsorted: il) : il =
    match unsorted with 
    | [] -> sorted
    | hd::tl -> aux (insert hd sorted) tl 
  in
  aux [] xs;;

(* Defining a new data type *)
type my_bool = Tru | Fal
(* 
  Tru and Fal are called "constructors".
  Constructors must start with a capital letter. 
  A value with type "my_bool" is one of two things: Tru or False.
  Read the vertical line as "or".
*)

type color = Blue | Yellow | Green | Red 

(* Creating values *)
let b1: my_bool = Tru;;
let b2: my_bool = Fal;;
let c1: color = Blue;;
let c2: color = Green;;

(* Now pattern-match *)
let print_color (c: color) : unit = 
  match c with 
  | Blue -> print_string "Blue"
  | Yellow -> print_string "Yellow"
  | Green -> print_string "Green"
  | Red -> print_string "Red";;


(* Data types are more than just enumerations of constants *)
type point = float * float;;

type simple_shape = 
  | Circle of point * float 
  | Square of point * float;;


let origin: point = (0.0, 0.0);;

let circ1: simple_shape = Circle (origin, 1.0);;
let circ2: simple_shape = Circle ((1.0, 1.0), 5.0);;

let square: simple_shape = Square (origin, 2.5);;

(* Inductive data types: Ex) binary trees*)

(* A binary tree is: 
  a Leaf node containing no data
  a Node containing a key, value, a left subtree, and a right subtree
*)

type key = string;; 
type value = int;; 

type tree = 
  | Leaf 
  | Node of key * value * tree * tree;;


let rec insert (t: tree) (k: key) (v: value) : tree = 
  match t with 
  | Leaf -> Node (k, v, Leaf, Leaf)
  | Node (k', v', left, right) ->
    if k < k' then
      Node (k', v', insert left k v, right)
    else if k > k' then 
      Node (k', v', left, insert right k v)
    else 
      Node (k, v, left, right);;


(* GML example*)
type markup = Ital | Bold | Font of string;;

type elt = 
  | Words of string list 
  | Formatted of markup * elt;;

type doc = elt list;;


let d = [ Formatted (Bold, Formatted (Font "Arial", Words ["Chapter"; "One"]));

  Words ["It"; "was"; "a"; "dark"; "&"; "stormy"; "night."; "A"];

  Formatted (Ital, Words["shot"]);

  Words ["rang"; "out."]];;


(* Change all the Arial fonts to Courier *)

let rec change_markup (m: markup) (font: string) : markup =
  match m with 
  | Font "Arial" -> Font font 
  | _ -> m;;

let rec change_font (e: elt) (font: string) : elt = 
  match e with 
  | Words ws -> Words ws
  | Formatted (m, e) -> 
    Formatted (change_markup m font, change_font e font);;

let rec change_fonts (doc: doc) (font: string) : doc = 
  match doc with 
  | [] -> []
  | hd::tl -> (change_font hd font)::(change_fonts tl font);;

let new_doc = change_fonts d "Courier";;

