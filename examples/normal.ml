open Owl

let n = 5
let a = Mat.gaussian n n

(* real symmetric matrices have real eigenvalues and eigenvectors *)
let evecs, evals = Linalg.D.eig a
let evecs2, evals2 = Owl_arpack.D.eigs ~which:`LM ~n ~nev:3 (`mat a)

let () =
  Dense.Matrix.Z.print evals;
  Mat.print evals2;
  Dense.Matrix.Z.print evecs;
  Mat.print evecs2
