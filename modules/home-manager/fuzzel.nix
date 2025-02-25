{ ... }:
{
  # https://mark.stosberg.com/fuzzel-a-great-dmenu-and-rofi-altenrative-for-wayland/
  # look into how to integrate with other programs
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        font = "Hack Nerd Font:size=12";
        icon-theme = "Papirus";
        terminal = "wezterm";
      };

      colors = {
        background = "282c34ff";
        input = "abb2bfff";
        text = "abb2bfff";
        match = "61afefff";
        selection = "61afefff";
        selection-text = "282c34ff";
        selection-match = "282c34ff";
        border = "61afefff";
      };

      border = {
        width = 1;
        radius = 1;
      };
    };
  };
}
