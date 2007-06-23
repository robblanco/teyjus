(***************************************************************************)
(* Data structure for recording the module information from disassembling  *)
(***************************************************************************)

(***************************************************************************)
(* kind information:                                                       *)
(***************************************************************************)
type kinds = Absyn.akind option array

(***************************************************************************)
(* type skeleton information:                                              *)
(***************************************************************************)
type typeskels = Absyn.atype list

(***************************************************************************)
(* constant information:                                                   *)
(***************************************************************************)
type constants = Absyn.aconstant option array

(***************************************************************************)
(* string information:                                                     *)
(***************************************************************************)
type strings = string list

(***************************************************************************)
(* implication tables:                                                     *)
(* impltable: (next clause table, find code fn, search table)              *)
(***************************************************************************)
type impltables = impltable list
and  impltable  = (Absyn.aconstant list * int * Absyn.aconstant list)

(***************************************************************************)
(* hash tables:                                                            *)
(* hash table:  (constant, label)                                          *)
(***************************************************************************)
type hashtables = ((Absyn.aconstant * Label.label) list) array

(***************************************************************************)
(* module table:                                                           *)
(* (next clause table, exportdef pred table, local pred table,             *)
(*  find code fn, search table)                                            *)
(***************************************************************************)
type moduletable =
	(Absyn.aconstant list * Absyn.aconstant list * Absyn.aconstant list *
	   int * Absyn.aconstant list)

(***************************************************************************)
(* renaming tables: (import/accumulate)                                    *)
(***************************************************************************)
type renamingtables = 
(string * ((string * Absyn.akind) list) * (string * Absyn.aconstant) list) list

(***************************************************************************)
(* module information:                                                     *)
(*   filename                                : string                      *)
(*   bytecode version number                 : int                         *)
(*   modname                                 : string                      *)
(*   codesize                                : int                         *)
(*   global kinds                            : kinds                       *)
(*   local  kinds                            : kinds                       *)
(*   type skeletons                          : typeskels                   *)
(*   global constants                        : constants                   *)
(*   local constants                         : constants                   *)
(*   hidden constants                        : constants                   *)
(*   strings                                 : strings                     *)
(*   implication table                       : impltables                  *)
(*   hash table                              : hashtables                  *)
(*   module table                            : moduletable                 *)
(*   accumulate renaming table               : renamingtables              *)
(*   import renaming table                   : renamingtables              *)
(*   instructions                            : Absyn.instructions          *)
(***************************************************************************)
type modcontext =
	ModContext of (string * int * string * int * kinds * kinds * typeskels *
				  constants * constants * constants * strings * impltables *
				  hashtables * moduletable * renamingtables * renamingtables *
				  Instr.instruction list)

(***************************************************************************)
(* Displaying module context                                               *)
(***************************************************************************)
val displayModContext : modcontext -> bool -> bool -> unit