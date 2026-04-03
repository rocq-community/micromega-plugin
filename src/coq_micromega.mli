(************************************************************************)
(*         *      The Rocq Prover / The Rocq Development Team           *)
(*  v      *         Copyright INRIA, CNRS and contributors             *)
(* <O___,, * (see version control and CREDITS file for authors & dates) *)
(*   \VV/  **************************************************************)
(*    //   *    This file is distributed under the terms of the         *)
(*         *     GNU Lesser General Public License Version 2.1          *)
(*         *     (see LICENSE file for the text of the license)         *)
(************************************************************************)

val mp_lra_Q : unit Proofview.tactic -> unit Proofview.tactic
val mp_lra_R : unit Proofview.tactic -> unit Proofview.tactic
val mp_lia : unit Proofview.tactic -> unit Proofview.tactic
val mp_nra_Q : unit Proofview.tactic -> unit Proofview.tactic
val mp_nra_R : unit Proofview.tactic -> unit Proofview.tactic
val mp_nia : unit Proofview.tactic -> unit Proofview.tactic
val mp_sos_Q : unit Proofview.tactic -> unit Proofview.tactic
val mp_sos_R : unit Proofview.tactic -> unit Proofview.tactic
val mp_sos_Z : unit Proofview.tactic -> unit Proofview.tactic
val mp_psatz_Q : int -> unit Proofview.tactic -> unit Proofview.tactic
val mp_psatz_R : int -> unit Proofview.tactic -> unit Proofview.tactic
val mp_psatz_Z : int -> unit Proofview.tactic -> unit Proofview.tactic
val print_lia_profile : unit -> unit

(** {5 Use Micromega independently from micromega parser. } *)

(** [wlra_Q id ff] takes a formula [ff : BFormula (Formula Q) isProp]
    generates a witness and poses it as [id : seq (Psatz Q)] *)
val mp_wlra_Q : Names.Id.t -> EConstr.t -> unit Proofview.tactic

(** [wlia id ff] takes a formula [ff : BFormula (Formula Z) isProp]
    generates a witness and poses it as [id : seq ZMicromega.ZArithProof] *)
val mp_wlia : Names.Id.t -> EConstr.t -> unit Proofview.tactic

(** [wnra_Q id ff] takes a formula [ff : BFormula (Formula Q) isProp]
    generates a witness and poses it as [id : seq (Psatz Q)] *)
val mp_wnra_Q : Names.Id.t -> EConstr.t -> unit Proofview.tactic

(** [wnia id ff] takes a formula [ff : BFormula (Formula Z) isProp]
    generates a witness and poses it as [id : seq ZMicromega.ZArithProof] *)
val mp_wnia : Names.Id.t -> EConstr.t -> unit Proofview.tactic

(** [wsos_Q id ff] takes a formula [ff : BFormula (Formula Q) isProp]
    generates a witness and poses it as [id : seq (Psatz Q)] *)
val mp_wsos_Q : Names.Id.t -> EConstr.t -> unit Proofview.tactic

(** [wsos_Z id ff] takes a formula [ff : BFormula (Formula Z) isProp]
    generates a witness and poses it as [id : seq ZMicromega.ZArithProof] *)
val mp_wsos_Z : Names.Id.t -> EConstr.t -> unit Proofview.tactic

(** [wpsatz_Q n id ff] takes a formula [ff : BFormula (Formula Q) isProp]
    generates a witness and poses it as [id : seq (Psatz Q)] *)
val mp_wpsatz_Q : int -> Names.Id.t -> EConstr.t -> unit Proofview.tactic

(** [wpsatz_Z n id ff] takes a formula [ff : BFormula (Formula Z) isProp]
    generates a witness and poses it as [id : seq ZMicromega.ZArithProof] *)
val mp_wpsatz_Z : int -> Names.Id.t -> EConstr.t -> unit Proofview.tactic

(** {5 Use Micromega independently from tactics. } *)

(** [dump_proof_term] generates the Rocq representation of a Micromega proof witness *)
val dump_proof_term : Micromega.zArithProof -> EConstr.t
