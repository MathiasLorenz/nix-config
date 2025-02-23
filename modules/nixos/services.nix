{ ... }:
{
  networking = {
    networkmanager.enable = true;
    firewall.enable = true;
  };

  virtualisation = {
    # install and enable docker daemon
    docker.enable = true;
  };

  services = {
    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.
    # xserver.enable = false;

    # enable firmware udpate daemon
    fwupd.enable = true;

    # Enable CUPS to print documents.
    printing.enable = true;

    # ssh server
    openssh.enable = true;

    # power profile daemon
    # TODO: configure
    # power-profiles-daemon.enable = false;

    # start keyring
    gnome.gnome-keyring.enable = true;
  };

}
