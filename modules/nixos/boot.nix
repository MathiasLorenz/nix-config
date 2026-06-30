{ pkgs, ... }:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # boot.kernelPackages = pkgs.linuxPackages_latest;
  # Try zen kernel package as that has bluetooth patch for 7.0.9
  boot.kernelPackages = pkgs.linuxPackages_zen;
}
