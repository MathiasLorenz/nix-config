{ ... }:
{
  services = {
    # Enable touchpad support (enabled default in most desktopManager).
    libinput.enable = true;

    # Recommended for AMD frame.work laptops, see https://wiki.nixos.org/wiki/Hardware/Framework/Laptop_13
    power-profiles-daemon.enable = true;
  };

  powerManagement = {
    enable = true;
    powertop.enable = true;
  };
}
