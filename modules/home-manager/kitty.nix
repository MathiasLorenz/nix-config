{ ... }:
{
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
}
