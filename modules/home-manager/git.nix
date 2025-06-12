{ ... }:
{
  programs.git = {
    enable = true;

    userName = "MathiasLorenz";
    # Todo: Make email path dependant
    userEmail = "lorenz.mathias@gmail.com";

    extraConfig = {
      pull.rebase = true;
      color.ui = true;
      core.editor = "nvim";
      init.defaultBranch = "main";
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
