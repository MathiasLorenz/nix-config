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
      settings = {
        Resolve = {
          DNSOverTLS = true;
          DNSSEC = true;
          Domains = [ "~." ];
          FallbackDNS = [
            "8.8.8.8"
            "8.8.4.4"
          ];
        };
      };
    };

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
