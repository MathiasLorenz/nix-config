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
          "battery#bat1"
          "bluetooth"
          "clock"
          "idle_inhibitor"
          "tray"
        ];

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "󰅶";
            deactivated = "󰛊";
          };
        };

        tray = {
          spacing = 10;
        };

        # Not tested/active yet
        "cpu" = {
          "interval" = 1;
          "format" = "{icon0}{icon1}{icon2}{icon3} {usage:>2}% ";
          "format-icons" = [
            "▁"
            "▂"
            "▃"
            "▄"
            "▅"
            "▆"
            "▇"
            "█"
          ];
        };

        "memory" = {
          "interval" = 30;
          "format" = "{used:0.1f}G/{total:0.1f}G ";
        };

        "sway/language" = {
          "format" = "{shortDescription} {flag}";
          "tooltip" = false;
        };

        clock = {
          "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          "format" = "{:%H:%M 󰥔  %d/%m-%Y }";
        };

        backlight = {
          format = "{percent}% {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };

        # Does not work properly with remapped keys
        "keyboard-state" = {
          capslock = true;
          format = "{icon}";
          format-icons = {
            # locked = "";
            # unlocked = "";
            locked = "CAPS";
            unlocked = "no caps";
          };
          empty = false;
        };

        "battery#bat0" = {
          bat = "BAT0";
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% 󱐋";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };

        "battery#bat1" = {
          bat = "BAT1";
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% 󱐋";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };

        bluetooth = {
          "format" = " {status}";
          "format-connected" = " {device_alias}";
          "format-connected-battery" = " {device_alias} {device_battery_percentage}%";
          "tooltip-format" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          "tooltip-format-connected" =
            "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          "tooltip-format-enumerate-connected" = "{device_alias}\t{device_address}";
          "tooltip-format-enumerate-connected-battery" =
            "{device_alias}\t{device_address}\t{device_battery_percentage}%";
          "on-click" = "blueman-manager";
        };

        network = {
          "format-wifi" = "";
          "format-ethernet" = "{ipaddr}/{cidr} 󰈁";
          "tooltip-format" = "{essid} ({signalStrength}%); {gwaddr} via {ifname} 󰈀 ";
          "format-linked" = "{ifname} (No IP) 󰈂";
          "format-disconnected" = "Disconnected ⚠";
          "format-alt" = "{ifname}: {ipaddr}/{cidr}";
        };

        pulseaudio = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = "󰖁 {icon} {format_source}";
          format-muted = "󰖁 {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "hands-free";
            headset = "headset";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "pavucontrol";
        };
      };
    };
  };
}
