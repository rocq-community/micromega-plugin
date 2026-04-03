(************************************************************************)
(*         *      The Rocq Prover / The Rocq Development Team           *)
(*  v      *         Copyright INRIA, CNRS and contributors             *)
(* <O___,, * (https://github.com/rocq-prover/stdlib for authors & dates)*)
(*   \VV/  **************************************************************)
(*    //   *    This file is distributed under the terms of the         *)
(*         *     GNU Lesser General Public License Version 2.1          *)
(*         *     (see LICENSE file for the text of the license)         *)
(************************************************************************)

From Corelib Require Import BinNums.
From micromega_plugin Require Import RatDef.
From micromega_plugin Require Export ring_checker.

Set Implicit Arguments.

Register Pc as micromega_plugin.Pol.Pc.
Register Pinj as micromega_plugin.Pol.Pinj.
Register PX as micromega_plugin.Pol.PX.

Inductive Psatz (C : Type) : Type :=
| PsatzLet: Psatz C -> Psatz C -> Psatz C
| PsatzIn : nat -> Psatz C
| PsatzSquare : Pol C -> Psatz C
| PsatzMulC : Pol C -> Psatz C -> Psatz C
| PsatzMulE : Psatz C -> Psatz C -> Psatz C
| PsatzAdd : Psatz C -> Psatz C -> Psatz C
| PsatzC : C -> Psatz C
| PsatzZ : Psatz C.

Register PsatzLet as micromega_plugin.Psatz.PsatzLet.
Register PsatzIn as micromega_plugin.Psatz.PsatzIn.
Register PsatzSquare as micromega_plugin.Psatz.PsatzSquare.
Register PsatzMulC as micromega_plugin.Psatz.PsatzMulC.
Register PsatzMulE as micromega_plugin.Psatz.PsatzMulE.
Register PsatzAdd as micromega_plugin.Psatz.PsatzAdd.
Register PsatzC as micromega_plugin.Psatz.PsatzC.
Register PsatzZ as micromega_plugin.Psatz.PsatzZ.

Definition QWitness := Psatz Q.

Register QWitness as micromega_plugin.QWitness.type.

Definition ZWitness := Psatz Z.

Inductive ZArithProof :=
| DoneProof
| RatProof : ZWitness -> ZArithProof -> ZArithProof
| CutProof : ZWitness -> ZArithProof -> ZArithProof
| SplitProof : Pol Z -> ZArithProof -> ZArithProof -> ZArithProof
| deprecated_EnumProof : ZWitness -> ZWitness -> list ZArithProof -> ZArithProof
| ExProof : positive -> ZArithProof -> ZArithProof
(*ExProof x : exists z t, x = z - t /\ z >= 0 /\ t >= 0 *)
.
#[deprecated(since="Stdlib 9.1")]
Notation EnumProof := deprecated_EnumProof (only parsing).

Register ZArithProof as micromega_plugin.ZArithProof.type.
Register DoneProof as micromega_plugin.ZArithProof.DoneProof.
Register RatProof as micromega_plugin.ZArithProof.RatProof.
Register CutProof as micromega_plugin.ZArithProof.CutProof.
Register SplitProof as micromega_plugin.ZArithProof.SplitProof.
Register ExProof as micromega_plugin.ZArithProof.ExProof.
