dune = etc/with-rocq-wrap.sh dune $(1) $(DUNE_$(1)_FLAGS) --stop-on-first-error

# This makefile is mostly calling dune and dune doesn't like
# being called in parralel, so we enforce -j1
.NOTPARALLEL:

build:
	$(call dune,build) -p micromega-plugin @install
.PHONY: build

install:
	$(call dune,install) micromega-plugin
.PHONY: install

test: build install
	$(MAKE) -C test-suite
.PHONY: test

nix:
	nix-shell --arg do-nothing true --run "updateNixToolBox && genNixActions"
.PHONY: nix
