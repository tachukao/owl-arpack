open Owl

let n = 10

let a =
  let x = Mat.gaussian n n in
  Mat.((x *@ transpose x) + (0.01 $* eye n))


(* real symmetric matrices have real eigenvalues and eigenvectors *)
let evecs, evals =
  let u, s, _ = Linalg.D.svd a in
  u, s


let evecs2, evals2 = Owl_arpack.D.eigsh ~which:`LA ~n ~nev:5 (`mat a)

let () =
  Mat.print evals;
  Mat.print evals2;
  Mat.print evecs;
  Mat.print evecs2
