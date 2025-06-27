{ pkgs-stable, ... }:
{
  # import theme defined in separate file
  # disabled for now as I like the default theme better
  # imports = [
  #   ./theme.nix
  # ];

  programs.qutebrowser = {
    enable = true;
    package = pkgs-stable.qutebrowser;

    settings = {
      tabs = {
        position = "left";
        select_on_remove = "last-used";
        show_switching_delay = 2500;
      };

      # https://qutebrowser.org/FAQ.html subsection about dark mode
      colors = {
        webpage = {
          # One way of enabling dark mode, relies on pages shipping dark color scheme css
          preferred_color_scheme = "dark";
          # Turn darkmode on for the underlying chromium browser
          darkmode = {
            enabled = false;
            policy = {
              images = "smart";
            };
          };
        };
      };

      # Not entirely sure what this does
      completion.shrink = true;

      # Re-open tabs from previous session
      auto_save.session = true;

      qt = {
        highdpi = true;
        # Trying to get hardware acceleration to work - not succeeding :sad-panda:
        # args = [
        #   "enable-features=VaapiVideoDecodeLinuxGL,AcceleratedVideoDecodeLinuxZeroCopyGL,AcceleratedVideoDecodeLinuxGL,VaapiIgnoreDriverChecks"
        #   "ignore-gpu-blacklist"
        #   "enable-gpu-rasterization"
        #   "enable-accelerated-video-decode"
        # ];
      };

      zoom.default = 120;

      downloads.location.directory = "~/Downloads/";
    };

    keyBindings = {
      normal = {
        "tt" = "config-cycle tabs.show always switching";
        "tsa" = "set tabs.show always";
        "tsn" = "set tabs.show never";
        "tsm" = "set tabs.show multiple";
        "tss" = "set tabs.show switching";
      };
    };

    # This loads settings configured via the GUI, which seems weird, but
    # e.g. permissions from the GUI (when you accept a page can open mail links etc)
    # are present in the auto config.
    loadAutoconfig = true;
  };
}
