{ pkgs, ... }:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # boot.kernelPackages = pkgs.linuxPackages_latest;
  # Zen kernel should be better optimized... Not sure if it really is.
  boot.kernelPackages = pkgs.linuxPackages_zen;
}
