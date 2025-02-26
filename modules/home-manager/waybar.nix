{ ... }:
{
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./waybar/style.css;

    systemd = {
      enable = true;
      target = "sway-session.target";
    };

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 0; # 0 is auto height
        spacing = 4;

        modules-left = [
          "sway/workspaces"
          "sway/mode"
        ];

        modules-center = [ "sway/window" ];

        modules-right = [
          "sway/language"
          "pulseaudio"
          "network"
          "backlight"
          "battery#bat0"
          "bluetooth"
          "clock"
          "idle_inhibitor"
          "tray"
        ];
      };
    };
  };
}
