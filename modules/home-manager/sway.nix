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
    font = "Hack Nerd Font 12";
    defaultTimeout = 30000;
    ignoreTimeout = true;
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
