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
      # Workaround for https://github.com/NixOS/nixpkgs/issues/576668
      # 8.12.42 ships chrome_crashpad_handler, which the package doesn't patchelf.
      # Reuse the interpreter and rpath of the main binary.
      package = pkgs._1password-gui.overrideAttrs (old: {
        postInstall = (old.postInstall or "") + ''
          crashpad=$out/share/1password/chrome_crashpad_handler
          if [ -f "$crashpad" ]; then
            patchelf --set-interpreter "$(patchelf --print-interpreter $out/share/1password/1password)" \
              --set-rpath "$(patchelf --print-rpath $out/share/1password/1password)" \
              "$crashpad"
          fi
        '';
      });
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
}
