# Micromega plugin

[![GitHub CI][gh-badge]][gh-link]
[![Contributing][contributing-shield]][contributing-link]
[![Code of Conduct][conduct-shield]][conduct-link]
[![Zulip][zulip-shield]][zulip-link]

[gh-badge]: https://github.com/proux01/micromega-plugin/actions/workflows/nix-action-rocq-master.yml/badge.svg
[gh-link]: https://github.com/proux01/micromega-plugin/actions/workflows/nix-action-rocq-master.yml

[contributing-shield]: https://img.shields.io/badge/contributions-welcome-%23f7931e.svg
[contributing-link]: https://github.com/rocq-community/manifesto/blob/master/CONTRIBUTING.md

[conduct-shield]: https://img.shields.io/badge/%E2%9D%A4-code%20of%20conduct-%23f15a24.svg
[conduct-link]: https://github.com/rocq-community/manifesto/blob/master/CODE_OF_CONDUCT.md

[zulip-shield]: https://img.shields.io/badge/chat-on%20zulip-%23c1272d.svg
[zulip-link]: https://rocq-prover.zulipchat.com/#narrow/stream/237663-rocq-community-devs-.26-users

The Micromega plugin is a plugin for the Rocq Prover providing
(semi)decision procedures for arithmetic.
End users can use it through tactics like `lra` in libraries using the plugin.

## Installation

Information on how to build and install from sources can be found in
[`INSTALL.md`](INSTALL.md).

## Documentation

Please refer to the libraries documentation for how to use the tactics.
Library developers can look at the comments in the `theories/*.v` files,
for instance starting with `theories/checker.v`.

## Bug reports

Please report any bug / feature request in [our issue tracker](https://github.com/rocq-community/micromega-plugin/issues).

To be effective, bug reports should mention the OCaml version used
to compile and run Rocq, the Rocq version (`rocq -v`)
and include a complete source example leading to the bug.
