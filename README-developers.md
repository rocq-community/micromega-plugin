## Development process

One can for instance use a dedicated opam switch with an appropriate
version of Rocq, compile the plugin with

```
$ make && make install
```

then cd to the user library (for instance MathComp) and build it.

Or using Nix (see for instance
[Nix installation](https://github.com/math-comp/math-comp/wiki/Using-nix#nix-installation)
for installation instructions)

```
$ nix-shell --argstr job mathcomp-algebra
[nix-shell]$ cd ../mathcomp/algebra
```

## CI

#### Adding an overlay

Follow the instructions in the comments in `common-bundles` in
`.nix/config.nix`. Typically, for the Ci to use your own branch of
mathcomp, one will write there

```
    mathcomp.override.version = "<my_github_login>:<my_branch>";
```

#### Updating the Nix toolbox

```
$ make nix
```

## Compilation with multiple Rocq versions

The plugin should compile with a pair of successive Rocq versions
(and Rocq master branch). To achieve this, one can use ppx_optcomp
in any src/*.ml file, taking inspiration on the segment below:

```ocaml
[%%if rocq = "9.0" || rocq = "9.1"]
let foobar = 0
[%%else]
let foobar = 1
[%%endif]
```
