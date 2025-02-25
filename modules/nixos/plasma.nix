# sometimes its conveient to be able to fall back on plasma when things dont work
{ ... }:
{
  services = {
    # display manager is set using separate nix module
    # see display-manager.nix

    desktopManager = {
      plasma6 = {
        enable = true;
      };
    };
  };
}
