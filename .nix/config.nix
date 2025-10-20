with builtins; with (import <nixpkgs> {}).lib;
{
  ## DO NOT CHANGE THIS
  format = "1.0.0";
  ## unless you made an automated or manual update
  ## to another supported format.

  ## The attribute to build from the local sources,
  ## either using nixpkgs data or the overlays located in `.nix/rocq-overlays`
  ## and `.nix/coq-overlays`
  ## Will determine the default main-job of the bundles defined below
  attribute = "micromega-plugin";

  ## If you want to select a different attribute (to build from the local sources as well)
  ## when calling `nix-shell` and `nix-build` without the `--argstr job` argument
  # shell-attribute = "{{nix_name}}";

  ## Indicate the relative location of your _CoqProject
  ## If not specified, it defaults to "_CoqProject"
  # coqproject = "_CoqProject";

  ## select an entry to build in the following `bundles` set
  ## defaults to "default"
  default-bundle = "rocq-9.1";

  ## write one `bundles.name` attribute set per
  ## alternative configuration
  ## When generating GitHub Action CI, one workflow file
  ## will be created per bundle
  bundles = let
    ## You can override Rocq and other Rocq rocqPackages
    ## through the following attribute
    # rocqPackages.rocq-core.override.version = "9.0";

    ## You can override Coq and other Coq coqPackages
    ## through the following attribute
    # coqPackages.coq.override.version = "8.11";

    ## In some cases, light overrides are not available/enough
    ## in which case you can use either
    # rocqPackages.<rocq-pkg>.overrideAttrs = o: <overrides>;
    # coqPackages.<coq-pkg>.overrideAttrs = o: <overrides>;
    ## or a "long" overlay to put in `.nix/rocq-overlays` or `.nix/coq-overlays`
    ## you may use `nix-shell --run fetchOverlay <coq-pkg>`
    ## to automatically retrieve the one from nixpkgs
    ## if it exists and is correctly named/located

    ## You can override Coq and other coqPackages
    ## through the following attribute
    ## If <ocaml-pkg> does not support light overrides,
    ## you may use `overrideAttrs` or long overlays
    ## located in `.nix/ocaml-overlays`
    ## (there is no automation for this one)
    #  ocamlPackages.<ocaml-pkg>.override.version = "x.xx";

    ## You can also override packages from the nixpkgs toplevel
    # <nix-pkg>.override.overrideAttrs = o: <overrides>;
    ## Or put an overlay in `.nix/overlays`

    ## you may mark a package as a main CI job (one to take deps and
    ## rev deps from) as follows
    # coqPackages.<main-pkg>.main-job = true;
    ## by default the current package and its shell attributes are main jobs

    ## you may mark a package as a CI job as follows
    #  rocqPackages.<another-pkg>.job = "test";
    #  coqPackages.<another-pkg>.job = "test";
    ## It can then built through
    ## nix-build --argstr bundle "default" --arg job "test";
    ## in the absence of such a directive, the job "another-pkg" will
    ## is still available, but will be automatically included in the CI
    ## via the command genNixActions only if it is a dependency or a
    ## reverse dependency of a job flagged as "main-job" (see above).

    ## Run on push on following branches (default [ "master" ])
    # push-branches = [ "master" "branch2" ];

    master = [
      "stdlib"
      "mathcomp"
    ];
    coq-master = [
      "coquelicot"
      "interval"
    ];
    common-bundles = listToAttrs (forEach master (p:
      { name = p; value.override.version = "master"; }))
    // {
      mathcomp.job = false;
      mathcomp-algebra.job = true;
      # To add an overlay applying to all bundles,
      # add below a line like
      #<package>.override.version = "<github_login>:<branch>";
      # where
      # * <package> will typically be one of the strings above (without the quotes)
      #   or look at https://github.com/NixOS/nixpkgs/tree/master/pkgs/development/coq-modules
      #   for a complete list of Coq packages available in Nix
      # * <github_login>:<branch> is such that this will use the branch <branch>
      #   from https://github.com/<github_login>/<repository>
      stdlib.override.version = "proux01:micromega-plugin";
      mathcomp.override.version = "proux01:ring";
    };
    coq-common-bundles = listToAttrs (forEach coq-master (p:
      { name = p; value.override.version = "master"; }))
    // {
      CoLoR.job = false;
      coqeal.job = false;
      mathcomp.job = false;
      mathcomp-character.job = false;
      mathcomp-infotheo.job = false;
      mathcomp-solvable.job = false;
      mathcomp-field.job = false;
      libvalidsdp.job = false;
      parseque.job = false;
      validsdp.job = false;
      wasmcert.job = false;
    };
  in {
    "rocq-master" = { rocqPackages = common-bundles // {
      rocq-core.override.version = "master";
      # stdlib.override.version = "master";
      rocq-elpi.override.version = "master";
      rocq-elpi.override.elpi-version = "3.4.1";
      hierarchy-builder.override.version = "master";
    }; coqPackages = coq-common-bundles // {
      coq.override.version = "master";
      coq-elpi.override.version = "master";
      coq-elpi.override.elpi-version = "3.4.1";
      hierarchy-builder.override.version = "master";
      coquelicot.job = false;
      interval.job = false;
    }; };
    "rocq-9.1" = { rocqPackages = common-bundles // {
      rocq-core.override.version = "9.1";
    }; coqPackages = coq-common-bundles // {
      coq.override.version = "9.1";
    }; };
    "rocq-9.0" = { rocqPackages = common-bundles // {
      rocq-core.override.version = "9.0";
    }; coqPackages = coq-common-bundles // {
      coq.override.version = "9.0";
    }; };
  };

  ## Cachix caches to use in CI
  ## Below we list some standard ones
  cachix.coq = {};
  cachix.coq-community.authToken = "CACHIX_AUTH_TOKEN";
  cachix.math-comp = {};

  ## If you have write access to one of these caches you can
  ## provide the auth token or signing key through a secret
  ## variable on GitHub. Then, you should give the variable
  ## name here. For instance, coq-community projects can use
  ## the following line instead of the one above:
  # cachix.coq-community.authToken = "CACHIX_AUTH_TOKEN";

  ## Or if you have a signing key for a given Cachix cache:
  # cachix.my-cache.signingKey = "CACHIX_SIGNING_KEY"

  ## Note that here, CACHIX_AUTH_TOKEN and CACHIX_SIGNING_KEY
  ## are the names of secret variables. They are set in
  ## GitHub's web interface.
}
