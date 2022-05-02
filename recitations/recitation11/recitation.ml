type int_stream = Cons of int * int_stream 

let head s = 
  match s with 
  | Cons (a, _) -> a 

let tail s = 
  match s with 
  | Cons (_, tl) -> tl 

let rec zeros = Cons (0, zeros)

(* Not good *)
(* let rec nat_from n = Cons (n, nat_from (n+1))
let nats = nat_from 0 *)

type 'a str = Cons of 'a * 'a stream 
  and 
  'a stream = unit -> 'a str 

let rec nat_from n = Cons (n, fun () -> (nat_from (n+1)))
let nats = nat_from 0

let head s = 
  match s () with
  | Cons (hd, _) -> hd 

let tail s = 
  match s () with 
  | Cons (_, tl) -> tl 

  