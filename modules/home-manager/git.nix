{ pkgs, ... }:
{
  programs = {
    git = {
      enable = true;
      signing.format = null;

      settings.user = {
        # todo: make email path dependent
        email = "lorenz.mathias@gmail.com";
        user.name = "MathiasLorenz";
      };

      settings = {
        pull.rebase = true;
        color.ui = true;
        core.editor = "nvim";
        init.defaultBranch = "main";
      };

      hooks.pre-commit = pkgs.writeShellScript "pre-commit" ''
        branch=$(git symbolic-ref --short HEAD 2>/dev/null)
        if [ "$branch" = "main" ] || [ "$branch" = "master" ]; then
          echo "ERROR: Direct commits to '$branch' are blocked." >&2
          echo "Create a feature branch: git switch -c <branch-name>" >&2
          echo "To override (rarely needed): git commit --no-verify" >&2
          exit 1
        fi
      '';
    };

    delta = {
      enable = true;
      options = {
        side-by-side = true;
        navigate = true;
        light = false;
        line-numbers = true;
        syntax-theme = "OneHalfDark";
        zero-style = "syntax dim";
        minus-style = "syntax bold auto";
      };
    };
  };
}
