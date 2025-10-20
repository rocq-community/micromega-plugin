Installing From Sources
=======================

To install and use the Micromega plugin, we recommend relying on [the Rocq
platform](https://github.com/rocq-prover/platform) or on a package manager
(e.g. opam or Nix). Opam 2.3 is known to work on Unix-like, macOS, and
native Windows platforms.

See https://rocq-prover.org/install to learn more.

If you need to build from sources manually (e.g. to
contribute to the plugin), the remainder of this
file explains how to do so.

Build Requirements
------------------

To compile the Micromega plugin yourself, you need Rocq >= 9.0.

Opam (https://opam.ocaml.org/) is recommended to install Rocq.

```
$ opam install rocq-core
```

should get you Rocq. See the OPAM documentation for more help.

Nix users can also get all the required dependencies by running:

```
$ nix-shell
```

Build and install procedure
---------------------------

To build and install the Micromega plugin do:

```
$ make
$ make install
```
