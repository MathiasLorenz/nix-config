{ ... }:
{
  programs = {
    git = {
      enable = true;

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
