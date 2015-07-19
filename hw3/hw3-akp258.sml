(*
Programming Languages Homework 3
Problem 3: ML
Alex Pine
2015/07/18
*)

(* 1. Function that takes a list and a number n, and returns true if the sum of the list equals n, and false otherwise. *)
fun sum_equals [] n = n = 0
  | sum_equals (x::xs) n = sum_equals xs (n - x);

(* 2. Length function using foldl. Calling in 'len' because 'length' is already defined. *)
fun len L =
  foldr (fn (value, acc) => acc + 1)
  	0 L;

(* 3. Reverse function using foldl. *)
fun reverse L =
  foldl (fn (value, acc_list) => value :: acc_list) [] L;

(* 4. Zip function, with a custom exception. *)
exception Mismatch;

fun zip ([], []) = []
  | zip (x::xs, y::ys) = (x, y) :: (zip (xs, ys))
  | zip (xs, []) = raise Mismatch
  | zip ([], ys) = raise Mismatch;

(* 5. Unzip function. *)
fun unzip xs =
  foldr (fn ((a, b), (list_a, list_b)) => (a :: list_a, b :: list_b))
  	([], []) xs;
