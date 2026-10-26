{
  description = "TODO";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # Renders the pre-commit hook config for the dev shell.
    lefthook.url = "github:Runeword/lefthook";
    lefthook.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { nixpkgs, lefthook, ... }:
    let
      # nixpkgs-unstable no longer evaluates for x86_64-darwin.
      forAllSystems =
        f:
        nixpkgs.lib.genAttrs [
          "x86_64-linux"
          "aarch64-linux"
          "aarch64-darwin"
        ] (system: f nixpkgs.legacyPackages.${system});
    in
    {
      # Entering the shell (via direnv) renders lefthook-generated.yml into the
      # repository and installs the git hooks: commit both lefthook files.
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          inputsFrom = [
            (lefthook.lib.${pkgs.stdenv.hostPlatform.system}.mkShell {
              hooks = {
                format-nix.enable = true;
                lint-nix.enable = true;
                format-yaml.enable = true;
                security-gitleaks.enable = true;
                auto-commit.enable = true;
              };
            })
          ];
        };
      });
    };
}
