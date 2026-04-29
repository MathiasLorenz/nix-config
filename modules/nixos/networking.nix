{ ... }:
{
  networking = {
    networkmanager = {
      enable = true;
      wifi = {
        backend = "iwd";
        powersave = true;
      };

      # from https://wiki.nixos.org/wiki/NetworkManager
      dns = "none";
    };

    # from https://wiki.nixos.org/wiki/NetworkManager
    useDHCP = false;
    dhcpcd.enable = false;

    # Disable for chromecast if needed
    firewall.enable = true;
    nftables.enable = true;

    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];
  };

  services = {
    netbird = {
      enable = true;

      clients.work = {
        port = 51820;
        name = "work";
        interface = "wt0";
        hardened = false;
        autoStart = false;
        ui.enable = false;
      };
    };
  };
}
