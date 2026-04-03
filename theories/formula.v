(************************************************************************)
(*         *      The Rocq Prover / The Rocq Development Team           *)
(*  v      *         Copyright INRIA, CNRS and contributors             *)
(* <O___,, * (https://github.com/rocq-prover/stdlib for authors & dates)*)
(*   \VV/  **************************************************************)
(*    //   *    This file is distributed under the terms of the         *)
(*         *     GNU Lesser General Public License Version 2.1          *)
(*         *     (see LICENSE file for the text of the license)         *)
(************************************************************************)
(*                                                                      *)
(* Micromega : A reflexive tactic using the Positivstellensatz          *)
(*                                                                      *)
(*  Frédéric Besson (Irisa/Inria) 2006-2019                             *)
(*                                                                      *)
(************************************************************************)

From Corelib Require Import PosDef.
From micromega_plugin Require Export ring_checker.

Set Implicit Arguments.

Register PEc as micromega_plugin.PExpr.PEc.
Register PEX as micromega_plugin.PExpr.PEX.
Register PEadd as micromega_plugin.PExpr.PEadd.
Register PEsub as micromega_plugin.PExpr.PEsub.
Register PEmul as micromega_plugin.PExpr.PEmul.
Register PEopp as micromega_plugin.PExpr.PEopp.
Register PEpow as micromega_plugin.PExpr.PEpow.

Register Pc as micromega_plugin.Pol.Pc.
Register Pinj as micromega_plugin.Pol.Pinj.
Register PX as micromega_plugin.Pol.PX.

Variant Op2 : Set := (** binary relations **)
| OpEq
| OpNEq
| OpLe
| OpGe
| OpLt
| OpGt.

Register OpEq as micromega_plugin.Op2.OpEq.
Register OpNEq as micromega_plugin.Op2.OpNEq.
Register OpLe as micromega_plugin.Op2.OpLe.
Register OpGe as micromega_plugin.Op2.OpGe.
Register OpLt as micromega_plugin.Op2.OpLt.
Register OpGt as micromega_plugin.Op2.OpGt.

#[universes(template)]
Record Formula (T : Type) : Type := Build_Formula {
  Flhs : PExpr T;
  Fop : Op2;
  Frhs : PExpr T
}.

Register Formula as micromega_plugin.Formula.type.
Register Build_Formula as micromega_plugin.Formula.Build_Formula.

(** Formulae are either interpreted over Prop or bool. *)
Variant kind : Type := isProp | isBool.

Register isProp as micromega_plugin.kind.isProp.
Register isBool as micromega_plugin.kind.isBool.

Section S.
Context {TA : Type}. (** type of interpreted atoms *)
Context {TX : kind -> Type}. (** type of uninterpreted terms (Prop) *)
Context {AA : Type}. (** type of annotations for atoms *)
Context {AF : Type}. (** type of formulae identifiers *)

Inductive GFormula : kind -> Type :=
| TT : forall (k : kind), GFormula k
| FF : forall (k : kind), GFormula k
| X : forall (k : kind), TX k -> GFormula k
| A : forall (k : kind), TA -> AA -> GFormula k
| AND : forall (k : kind), GFormula k -> GFormula k -> GFormula k
| OR : forall (k : kind), GFormula k -> GFormula k -> GFormula k
| NOT : forall (k : kind), GFormula k -> GFormula k
| IMPL : forall (k : kind), GFormula k -> option AF -> GFormula k -> GFormula k
| IFF : forall (k : kind), GFormula k -> GFormula k -> GFormula k
| EQ : GFormula isBool -> GFormula isBool -> GFormula isProp.
End S.

Register TT as micromega_plugin.GFormula.TT.
Register FF as micromega_plugin.GFormula.FF.
Register X as micromega_plugin.GFormula.X.
Register A as micromega_plugin.GFormula.A.
Register AND as micromega_plugin.GFormula.AND.
Register OR as micromega_plugin.GFormula.OR.
Register NOT as micromega_plugin.GFormula.NOT.
Register IMPL as micromega_plugin.GFormula.IMPL.
Register IFF as micromega_plugin.GFormula.IFF.
Register EQ as micromega_plugin.GFormula.EQ.

Definition eKind (k : kind) := if k then Prop else bool.

Register eKind as micromega_plugin.eKind.

(** Typical boolean formulae *)
Definition BFormula (A : Type) := @GFormula A eKind unit unit.

Register BFormula as micromega_plugin.BFormula.type.
