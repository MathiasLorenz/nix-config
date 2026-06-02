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

    localsend = {
      enable = true;
      openFirewall = true;
    };
  };

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "slack"
      "1password"
      "1password-cli"
      "widevine-cdm"
      "steam"
      "steam-unwrapped"
      "postman"
      "claude-code"
    ];

  # https://github.com/NixOS/nixpkgs/issues/521305
  # bitwarden-desktop upstream has a dep on electron 39, which is EOL
  # This allows the package to be built. When the above issue is fixed,
  # this can be removed
  nixpkgs.config.permittedInsecurePackages = [
    "electron-39.8.10"
  ];
}
