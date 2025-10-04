{ ... }:
{
  networking = {
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };

    # Disable for chromecast if needed
    firewall.enable = true;
    nftables.enable = true;

    # systemd.resolved
    nameservers = [
      "1.1.1.1#one.one.one.one"
      "1.0.0.1#one.one.one.one"
    ];
  };

  services = {
    resolved = {
      enable = true;
      dnssec = "true";
      domains = [ "~." ];
      fallbackDns = [
        "8.8.8.8"
        "8.8.4.4"
      ];
      dnsovertls = "true";
    };

    netbird = {
      enable = true;

      clients.work = {
        port = 51820;
        name = "work";
        interface = "wt0";
        hardened = false;
        autoStart = false;
      };
    };

  };

}
