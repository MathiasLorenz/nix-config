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

  # Fix failing build of qt package, can be removed after
  # https://github.com/NixOS/nixpkgs/pull/400139 is merged
  nixpkgs.overlays = [
    (final: prev: {
      qt6Packages = prev.qt6Packages.overrideScope (
        _: kprev: {
          qt6gtk2 = kprev.qt6gtk2.overrideAttrs (_: {
            version = "0.5-unstable-2025-03-04";
            src = final.fetchFromGitLab {
              domain = "opencode.net";
              owner = "trialuser";
              repo = "qt6gtk2";
              rev = "d7c14bec2c7a3d2a37cde60ec059fc0ed4efee67";
              hash = "sha256-6xD0lBiGWC3PXFyM2JW16/sDwicw4kWSCnjnNwUT4PI=";
            };
          });
        }
      );
    })
  ];
}
