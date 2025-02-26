{ ... }:
{
  security = {
    polkit.enable = true;

    # This is supposed to ensure swaylock works
    pam.services.swaylock = { };
  };

  # Enable the gnome-keyring secrets vault.
  # Will be exposed through DBus to programs willing to store secrets.
  services.gnome.gnome-keyring.enable = true;

  # Even though sway is enabled in home-manager it doesn't get registrered with the
  # login manager unless it is also enabled here...
  programs.sway = {
    enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };
}
