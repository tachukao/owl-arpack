# Owl ARPACK

This library contains large-scale eigenvalue problem solvers: `eigs` and `eighs`. 
It is built on top of [ARPACK-NG](https://github.com/opencollab/arpack-ng) and [Owl](https://github.com/owlbarn/owl).

## Usage
Suppose you would like the 6 largest magnitude eigenvalues and eigenvectors of a `n`-dimensional real symmetric, double-precision matrix `_A`. You could simply write:

```ocaml
let evecs, evals =  Owl_arpack.D.eighs ~which:`LM ~n ~nev:6 (`mat _A)
```
If the matrix `_A` is too expensive to store explicitly, you could also provide your own matrix-vector product operation `mv`
```ocaml
let evecs, evals =  Owl_arpack.D.eighs ~which:`LM ~n ~nev:6 (`mv mv)
```
where `mv` has type
```ocaml
val mv : (float, float64_elt, c_layout) Array1.t -> (float, float64_elt, c_layout) Array1.t
```
and `mv x y` performs the matrix-vector product `y = _Ax`.


## Dependencies

- [Owl](https://github.com/owlbarn/owl)
- [ocaml-arpack](https://github.com/tachukao/ocaml-arpack)
- [ARPACK-NG](https://github.com/opencollab/arpack-ng)