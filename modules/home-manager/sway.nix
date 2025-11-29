{ pkgs, ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;
    wrapperFeatures = {
      gtk = true;
    };
  };

  services.mako = {
    enable = true;
    settings = {
      font = "Hack Nerd Font 12";
      default-timeout = 25000;
      ignore-timeout = true;
    };
  };

  # https://mark.stosberg.com/fuzzel-a-great-dmenu-and-rofi-altenrative-for-wayland/
  # look into how to integrate with other programs
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        font = "Hack Nerd Font:size=12";
        icon-theme = "Papirus";
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

  # Use plain config, one day I'll convert to home-manager (pinky promise)
  xdg.configFile."sway/config".source = pkgs.lib.mkOverride 0 ./sway/config;

  home.packages = with pkgs; [
    swaybg
    swayidle
    swaylock # Even when using the correct password I can't unluck with this - it works if installed with pacman..
    swayimg

    # Screenshot/clipboard
    wl-clipboard
    grim # screenshots
    slurp # select region in wayland, used together with screenshots

    blueman
    pavucontrol # pulse audio volume control
  ];
}
