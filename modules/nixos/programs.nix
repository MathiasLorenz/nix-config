{ pkgs, username, ... }:
{
  programs = {
    nh = {
      enable = true;
      clean = {
        enable = true;
      };
    };

    _1password.enable = true; # cli
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = [ username ];
    };
  };

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "slack"
      "1password"
      "1password-cli"
      "widevine-cdm"
      "chromium"
      "chromium-unwrapped"
    ];
}
