{ pkgs, ... }:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # boot.kernelPackages = pkgs.linuxPackages_latest;
  # Try zen kernel package as that has bluetooth patch for 7.0.9
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # temp fix for linux zen 7.0.12 not being found properly,
  # see https://github.com/nixos/nixpkgs/issues/535850
  system.boot.loader.kernelFile = "vmlinuz";
}
