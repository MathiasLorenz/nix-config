{ pkgs, ... }:
{
  programs = {
    firefox.enable = true;

    nh = {
      enable = true;
      clean = {
        enable = true;
      };
    };
  };

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "slack"
      "1password"
      "1password-cli"
    ];

}
