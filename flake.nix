{
  outputs = _: {
    templates = {
      js = {
        path = ./js;
        description = "js";
        welcomeText = "js";
      };

      node = {
        path = ./node;
        description = "node";
        welcomeText = "node";
      };

      proto = {
        path = ./proto;
        description = "proto";
        welcomeText = "proto";
      };

      firebase = {
        path = ./firebase;
        description = "firebase";
        welcomeText = "firebase";
      };

      go = {
        path = ./go;
        description = "go";
        welcomeText = "go";
      };

      py = {
        path = ./py;
        description = "py";
        welcomeText = "py";
      };

      lambda = {
        path = ./lambda;
        description = "lambda";
        welcomeText = "lambda";
      };

      rust = {
        path = ./rust;
        description = "rust";
        welcomeText = "rust";
      };

      base = {
        path = ./base;
        description = "Nix flake repository: lefthook dev shell and a CI check job";
        welcomeText = ''
          Next:

          - `nix flake init -t github:Runeword/templates#dependabot`
          - set `description` in flake.nix
          - commit, then `direnv allow` and `nix-direnv-reload`: the dev shell
            writes lefthook-generated.yml and installs the hooks; commit it
          - add the repository to `local.repos` in Runeword/admin
        '';
      };

      dependabot = {
        path = ./dependabot;
        description = "Dependabot for flake inputs and GitHub Actions: weekly, 7-day cooldown";
        welcomeText = ''
          Commit .github/dependabot.yml. In a repository without workflows,
          drop its github-actions entry: Dependabot fails on it every week.
        '';
      };
    };
  };
}
