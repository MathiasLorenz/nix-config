{ ... }:
{
  virtualisation = {
    docker = {
      enable = false;
      enableOnBoot = false;
    };

    podman = {
      enable = true;
    };

    # On 15/10-2026 there seems to be a regression with podman <-> journald integration
    # after linking to systemd-minimal-libs-261.3 (from systemd-261.3).
    # This should hopefully fix the issue (not getting log messages)
    containers.containersConf.settings.containers.log_driver = "k8s-file";
  };

  services = {
    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.
    # xserver.enable = false;

    # enable firmware udpate daemon
    fwupd.enable = true;

    # start keyring
    gnome.gnome-keyring.enable = true;

    # locate/mlocate functionality
    locate = {
      enable = true;
      # Update database on an interval
      interval = "hourly";
    };

    # USB multiplexing daemon to allow iphone to connect over usb
    usbmuxd.enable = true;
  };
}
