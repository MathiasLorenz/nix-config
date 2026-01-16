{ inputs, pkgs, ... }:
{
  programs.claude-code = {
    enable = true;
    package = inputs.claude-code.packages.${pkgs.stdenv.hostPlatform.system}.claude-code-bun;

    settings = {
      theme = "dark";
    };
  };

  programs.opencode = {
    enable = true;
    settings = {
      autoupdate = false;
    };
  };
}
