{ ... }:
{
  networking = {
    networkmanager.enable = true;
    # Disable for chromecast if needed
    firewall.enable = true;
    nftables.enable = true;

    nameservers = [
      "127.0.0.1"
      "::1"
    ];
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

    # start keyring
    gnome.gnome-keyring.enable = true;

    # locate/mlocate functionality
    locate = {
      enable = true;
      # Update database on an interval
      interval = "hourly";
    };

    # https://nixos.wiki/wiki/Encrypted_DNS
    dnscrypt-proxy2 = {
      enable = true;
      # Settings reference:
      # https://github.com/DNSCrypt/dnscrypt-proxy/blob/master/dnscrypt-proxy/example-dnscrypt-proxy.toml
      settings = {
        ipv6_servers = true;
        require_dnssec = true;
        # Add this to test if dnscrypt-proxy is actually used to resolve DNS requests
        # query_log.file = "/var/log/dnscrypt-proxy/query.log";
        sources.public-resolvers = {
          urls = [
            "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
            "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
          ];
          cache_file = "/var/cache/dnscrypt-proxy/public-resolvers.md";
          minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
        };

        # You can choose a specific set of servers from https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v3/public-resolvers.md
        server_names = [
          "mullvad-doh"
          "njalla-doh"
          # Doesn't work :shrug:
          # "noads.joindns4.eu/dns-query"
        ];
      };
    };
  };
}
