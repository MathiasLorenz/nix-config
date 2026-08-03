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
        red='\033[31m'
        reset='\033[0m'
        branch=$(git symbolic-ref --short HEAD 2>/dev/null)
        if [ "$branch" = "main" ] || [ "$branch" = "master" ]; then
          printf "%bERROR: Direct commits to '%s' are blocked.%b\n" "$red" "$branch" "$reset" >&2
          printf "%bCreate a feature branch: git switch -c <branch-name>%b\n" "$red" "$reset" >&2
          printf "%bTo override: git commit --no-verify%b\n" "$red" "$reset" >&2
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
