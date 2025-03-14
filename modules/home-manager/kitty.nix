{ ... }:
{
  programs.kitty = {
    enable = true;

    shellIntegration = {
      enableFishIntegration = true;
      enableBashIntegration = true;
    };

    font.name = "Hack Nerd Font";
    # themeFile = "OneDark-Pro";
    themeFile = "Dracula";
  };
}
