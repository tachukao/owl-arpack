open Bigarray

module S :
  Owl_arpack_intf.R with type elt := float32_elt and type mat := Owl.Dense.Matrix.S.mat

module D :
  Owl_arpack_intf.R with type elt := float64_elt and type mat := Owl.Dense.Matrix.D.mat

module C :
  Owl_arpack_intf.C with type elt := complex32_elt and type mat := Owl.Dense.Matrix.C.mat

module Z :
  Owl_arpack_intf.C with type elt := complex64_elt and type mat := Owl.Dense.Matrix.Z.mat
