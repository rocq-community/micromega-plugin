(lang dune 3.21)
(using rocq 0.11)
(name rocq-micromega-plugin)
;(generate_opam_files)

(source (github rocq-community/micromega-plugin))
(license LGPL-2.1)
(authors "Frederic Besson")
(maintainers "Pierre Roux")

(package
 (name rocq-micromega-plugin)
 (synopsis "Micromega plugin for Rocq")
 (description
  "Plugin for (semi)decision procedures for arithmetic.")
 (tags
  ("category:Miscellaneous/Coq Extensions"
   "keyword:micromega"
   "logpath:micromega-plugin"))
 (depends
  (ocaml (>= 4.09.0))
  (rocq-core (and (>= 9.0) (< 9.2~)))
  ppx_optcomp))
