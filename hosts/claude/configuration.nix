# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  ...
}:

{
  networking.hostName = "claude";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/nixos/boot.nix
    ../../modules/nixos/display-manager.nix
    ../../modules/nixos/user.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/neovim.nix
    ../../modules/nixos/services.nix
    ../../modules/nixos/programs.nix
    ../../modules/nixos/sway.nix
    ../../modules/nixos/bluetooth.nix
    ../../modules/nixos/qutebrowser.nix
    ../../modules/nixos/env-variables.nix
    ../../modules/nixos/steam.nix
  ];

  # OpenCL support with ROCm
  hardware.amdgpu.opencl.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
