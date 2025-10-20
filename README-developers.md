## Development process

One can for instance use a dedicated opam switch with an appropriate
version of Rocq, compile the plugin with

```
$ make && make install
```

then cd to the user library (for instance MathComp) and build it.

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
