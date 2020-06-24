open Bigarray

module type R = sig
  type mat
  type elt

  val eigsh
    :  ?tol:float
    -> ?which:[< `BE | `LA | `LM | `SA | `SM > `LM ]
    -> ?max_iter:int
    -> ?ncv:int
    -> n:int
    -> nev:int
    -> [< `mat of mat
       | `mv of (float, elt, c_layout) Array1.t -> (float, elt, c_layout) Array1.t -> unit
       ]
    -> mat * mat

  val eigshvals
    :  ?tol:float
    -> ?which:[< `BE | `LA | `LM | `SA | `SM > `LM ]
    -> ?max_iter:int
    -> ?ncv:int
    -> n:int
    -> nev:int
    -> [< `mat of (float, elt, c_layout) Genarray.t
       | `mv of (float, elt, c_layout) Array1.t -> (float, elt, c_layout) Array1.t -> unit
       ]
    -> mat

  val eigs
    :  ?tol:float
    -> ?which:[< `LI | `LM | `SI | `SM | `SR > `LM ]
    -> ?max_iter:int
    -> ?ncv:int
    -> n:int
    -> nev:int
    -> [< `mat of mat
       | `mv of (float, elt, c_layout) Array1.t -> (float, elt, c_layout) Array1.t -> unit
       ]
    -> mat * mat

  val eigsvals
    :  ?tol:float
    -> ?which:[< `LI | `LM | `SI | `SM | `SR > `LM ]
    -> ?max_iter:int
    -> ?ncv:int
    -> n:int
    -> nev:int
    -> [< `mat of mat
       | `mv of (float, elt, c_layout) Array1.t -> (float, elt, c_layout) Array1.t -> unit
       ]
    -> mat
end

module type C = sig
  type mat
  type elt

  val eigs
    :  ?tol:float
    -> ?which:[< `LI | `LM | `SI | `SM | `SR > `LM ]
    -> ?max_iter:int
    -> ?ncv:int
    -> n:int
    -> nev:int
    -> [< `mat of mat
       | `mv of
         (Complex.t, elt, c_layout) Array1.t
         -> (Complex.t, elt, c_layout) Array1.t
         -> unit
       ]
    -> mat * mat

  val eigsvals
    :  ?tol:float
    -> ?which:[< `LI | `LM | `SI | `SM | `SR > `LM ]
    -> ?max_iter:int
    -> ?ncv:int
    -> n:int
    -> nev:int
    -> [< `mat of mat
       | `mv of
         (Complex.t, elt, c_layout) Array1.t
         -> (Complex.t, elt, c_layout) Array1.t
         -> unit
       ]
    -> mat
end
