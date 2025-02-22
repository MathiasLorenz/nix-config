{ ... }:
{
  programs.ghostty = {
    enable = true;

    enableBashIntegration = true;
    enableFishIntegration = true;
    settings = {
      theme = "DoomOne";
      font-family = "Hack Nerd Font";
    };
  };
}

