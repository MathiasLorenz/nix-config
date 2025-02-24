{ ... }:
{
  # import theme defined in separate file
  imports = [
    ./theme.nix
  ];

  programs.qutebrowser = {
    enable = true;

    settings = {
      tabs = {
        position = "left";
        select_on_remove = "last-used";
        show_switching_delay = 2500;
      };

      colors = {
        webpage = {
          darkmode = {
            enabled = true;
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
        args = [ "enable-features=VaapiVideoDecodeLinuxGL" ];
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
  };
}
