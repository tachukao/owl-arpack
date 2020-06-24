open Bigarray

let mv a =
  (* simple function that does matrix vector products
     y = ax for squared matrices a *)
  let shp = Genarray.dims a in
  assert (Array.length shp == 2);
  assert (shp.(0) = shp.(1));
  let n = shp.(0) in
  let incx = 1 in
  let incy = 1 in
  let _kind = Genarray.kind a in
  let alpha = Owl_const.one _kind in
  let beta = Owl_const.zero _kind in
  let layout = Owl_cblas_basic.CblasRowMajor in
  let lda = n in
  let a = a |> Owl_dense_ndarray_generic.flatten |> array1_of_genarray in
  fun x y -> Owl_cblas_basic.gemv layout CblasNoTrans n n alpha a lda x incx beta y incy


let unpack_mv = function
  | `mat a -> mv a
  | `mv x  -> x


module S = struct
  let eigsh ?(tol = 0.) ?(which = `LM) ?max_iter ?ncv ~n ~nev mv =
    let evecs, evals = Arpack.S.eigsh ~tol ~which ?max_iter ?ncv ~n ~nev (unpack_mv mv) in
    Owl.Dense.Matrix.S.transpose evecs, evals


  let eigshvals ?(tol = 0.) ?(which = `LM) ?max_iter ?ncv ~n ~nev mv =
    Arpack.S.eigshvals ~tol ~which ?max_iter ?ncv ~n ~nev (unpack_mv mv)


  let eigs ?(tol = 0.) ?(which = `LM) ?max_iter ?ncv ~n ~nev mv =
    let evecs, evals = Arpack.S.eigs ~tol ~which ?max_iter ?ncv ~n ~nev (unpack_mv mv) in
    Owl.Dense.Matrix.S.transpose evecs, evals


  let eigsvals ?(tol = 0.) ?(which = `LM) ?max_iter ?ncv ~n ~nev mv =
    Arpack.S.eigsvals ~tol ~which ?max_iter ?ncv ~n ~nev (unpack_mv mv)
end

module D = struct
  let eigsh ?(tol = 0.) ?(which = `LM) ?max_iter ?ncv ~n ~nev mv =
    let evecs, evals = Arpack.D.eigsh ~tol ~which ?max_iter ?ncv ~n ~nev (unpack_mv mv) in
    Owl.Dense.Matrix.D.transpose evecs, evals


  let eigshvals ?(tol = 0.) ?(which = `LM) ?max_iter ?ncv ~n ~nev mv =
    Arpack.D.eigshvals ~tol ~which ?max_iter ?ncv ~n ~nev (unpack_mv mv)


  let eigs ?(tol = 0.) ?(which = `LM) ?max_iter ?ncv ~n ~nev mv =
    let evecs, evals = Arpack.D.eigs ~tol ~which ?max_iter ?ncv ~n ~nev (unpack_mv mv) in
    Owl.Dense.Matrix.D.transpose evecs, evals


  let eigsvals ?(tol = 0.) ?(which = `LM) ?max_iter ?ncv ~n ~nev mv =
    Arpack.D.eigsvals ~tol ~which ?max_iter ?ncv ~n ~nev (unpack_mv mv)
end

module C = struct
  let eigs ?(tol = 0.) ?(which = `LM) ?max_iter ?ncv ~n ~nev mv =
    let evecs, evals = Arpack.C.eigs ~tol ~which ?max_iter ?ncv ~n ~nev (unpack_mv mv) in
    Owl.Dense.Matrix.C.transpose evecs, evals


  let eigsvals ?(tol = 0.) ?(which = `LM) ?max_iter ?ncv ~n ~nev mv =
    Arpack.C.eigsvals ~tol ~which ?max_iter ?ncv ~n ~nev (unpack_mv mv)
end

module Z = struct
  let eigs ?(tol = 0.) ?(which = `LM) ?max_iter ?ncv ~n ~nev mv =
    let evecs, evals = Arpack.Z.eigs ~tol ~which ?max_iter ?ncv ~n ~nev (unpack_mv mv) in
    Owl.Dense.Matrix.Z.transpose evecs, evals


  let eigsvals ?(tol = 0.) ?(which = `LM) ?max_iter ?ncv ~n ~nev mv =
    Arpack.Z.eigsvals ~tol ~which ?max_iter ?ncv ~n ~nev (unpack_mv mv)
end
