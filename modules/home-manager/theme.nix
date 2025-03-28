{ pkgs, ... }:
{
  # All is stolen from zanderhavgaard config
  # This does break log in to Plasma Wayland...
  gtk = {
    enable = true;

    gtk3 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };
    gtk4 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };

    cursorTheme = {
      name = "capitaine-cursors";
      package = pkgs.capitaine-cursors;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    theme = {
      name = "Arc-Dark";
      package = pkgs.arc-theme;
    };
  };

  dconf = {
    enable = true;
    # Not sure I have anything gnome related installed so I'll leave this out for now
    # settings = {
    #   "org/gnome/desktop/interface" = {
    #     color-scheme = "prefer-dark";
    #   };
    # };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };

  # Doesn't really work...
  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    sway.enable = true;

    name = "capitaine-cursors";
    package = pkgs.capitaine-cursors;
    size = 24;
  };
}
