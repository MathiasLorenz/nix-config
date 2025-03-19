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

  programs.kitty = {
    enable = true;

    shellIntegration = {
      enableFishIntegration = true;
      enableBashIntegration = true;
    };

    font.name = "Hack Nerd Font";
    font.size = 11;

    # themeFile = "OneDark-Pro";
    themeFile = "Dracula";
  };

  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "Hack Nerd Font:size=10";
        dpi-aware = "yes";
      };

      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
