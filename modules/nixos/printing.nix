{ ... }:
{
  services = {
    # Enable CUPS to print documents.
    printing.enable = true;
    # For wifi printers
    avahi = {
      enable = true;
      nssmdns4 = true;
    };
  };
}
