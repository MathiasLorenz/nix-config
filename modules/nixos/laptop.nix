{ ... }:
{
  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  powerManagement.enable = true;

  # enable tlp... see https://nixos.wiki/wiki/Laptop
}
