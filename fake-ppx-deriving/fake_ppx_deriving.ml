(* Fake ppx_deriving library.

   When ppx_deriving is not available, this module is used instead of Ppx_deriving. It
   provides a dummy implementation of a subset of Ppx_deriving.
*)

open Parsetree

type deriver =
  { name : string
  ; core_type : (core_type -> expression) option
  ; type_decl_str : options:(string * expression) list -> path:string list ->
      type_declaration list -> structure
  ; type_ext_str : options:(string * expression) list -> path:string list ->
      type_extension -> structure
  ; type_decl_sig : options:(string * expression) list -> path:string list ->
      type_declaration list -> signature
  ; type_ext_sig : options:(string * expression) list -> path:string list ->
      type_extension -> signature
  }

let default ~options:_ ~path:_ _ = []

let create
      name
      ?core_type
      ?(type_ext_str=default)
      ?(type_ext_sig=default)
      ?(type_decl_str=default)
      ?(type_decl_sig=default)
      ()
  =
  { name
  ; core_type
  ; type_ext_str
  ; type_ext_sig
  ; type_decl_str
  ; type_decl_sig
  }

let register = ignore
let add_register_hook = ignore
let derivers () = []
