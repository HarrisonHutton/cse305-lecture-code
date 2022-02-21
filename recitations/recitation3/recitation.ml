type 'a btree = 
  | Leaf of 'a 
  | Node of 'a * 'a btree * 'a btree 


(* 
            5
          /   \
        3      8
             /  \
            6   9
*)
let int_btree = Node (5, Leaf 3, Node (8, Leaf 6, Leaf 9));;

(* Binary Search *)
let rec binarySearch bt target = 
  match bt with 
  | Leaf v -> if target == v then Some v else None 
  | Node (v, lb, rb) -> if target == v then Some v else if target < v then binarySearch lb target else binarySearch rb target ;;