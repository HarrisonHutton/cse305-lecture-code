let rec search (ls: (int * string) list) (target: int): string = 
  match ls with 
  | [] -> "Not found"
  | (i, s)::tl ->
    if i == target then 
      s 
    else 
      search tl target;;
