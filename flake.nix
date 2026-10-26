{
  outputs =
    { self }:
    {
      templates = {
        js.path = ./js;
        js.description = "js";
        js.welcomeText = "js";

        node.path = ./node;
        node.description = "node";
        node.welcomeText = "node";

        proto.path = ./proto;
        proto.description = "proto";
        proto.welcomeText = "proto";

        firebase.path = ./firebase;
        firebase.description = "firebase";
        firebase.welcomeText = "firebase";

        go.path = ./go;
        go.description = "go";
        go.welcomeText = "go";

        py.path = ./py;
        py.description = "py";
        py.welcomeText = "py";

        lambda.path = ./lambda;
        lambda.description = "lambda";
        lambda.welcomeText = "lambda";

        rust.path = ./rust;
        rust.description = "rust";
        rust.welcomeText = "rust";

        base.path = ./base;
        base.description = "Nix flake repository: lefthook dev shell and a CI check job";
        base.welcomeText = ''
          Next:

          - `nix flake init -t github:Runeword/templates#dependabot`
          - set `description` in flake.nix
          - commit, then `direnv allow` and `nix-direnv-reload`: the dev shell
            writes lefthook-generated.yml and installs the hooks; commit it
          - add the repository to `local.repos` in Runeword/admin
        '';

        dependabot.path = ./dependabot;
        dependabot.description = "Dependabot for flake inputs and GitHub Actions: weekly, 7-day cooldown";
        dependabot.welcomeText = ''
          Commit .github/dependabot.yml. In a repository without workflows,
          drop its github-actions entry: Dependabot fails on it every week.
        '';
      };
    };
}
