open Owl
module M = Dense.Matrix.Z

let n = 5
let a = M.gaussian n n

(* real symmetric matrices have real eigenvalues and eigenvectors *)
let evecs, evals = Linalg.Z.eig a
let evecs2, evals2 = Owl_arpack.Z.eigs ~which:`LM ~n ~nev:3 (`mat a)

let () =
  M.print evals;
  M.print evals2;
  M.print evecs;
  M.print evecs2
