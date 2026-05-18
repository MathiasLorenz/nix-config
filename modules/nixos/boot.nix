{ pkgs, ... }:
# Linux 7.0.7 and 7.0.8 have kernel/driver issues for bluetooth, use latest 'stable' for this
let
  linux_7_0_6 = pkgs.linux_7_0.override {
    argsOverride = rec {
      version = "7.0.6";
      modDirVersion = version;
      src = pkgs.fetchurl {
        url = "mirror://kernel/linux/kernel/v7.x/linux-${version}.tar.xz";
        hash = "sha256-y6REQKpXr/18ISQdxbwjSw31PEmfj/w+vCkN0zkKdSM=";
      };
    };
  };
in
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackagesFor linux_7_0_6;

  # disable for now to mitigate driver/kernel issues with bluetooth
  # use latest kernel version
  # boot.kernelPackages = pkgs.linuxPackages_latest;
}
