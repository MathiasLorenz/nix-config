{
  pkgs,
  config,
  inputs,
  ...
}:
let
  firefox-addons = inputs.nur.legacyPackages.${pkgs.system}.repos.rycee.firefox-addons;
  firefoxExtensions = with firefox-addons; [
    ublock-origin
    vimium
  ];
  firefoxSettings = {
    "extensions.autoDisableScopes" = 0;
    "sidebar.revamp" = true;
    "sidebar.verticalTabs" = true;
    # Resume the previous session's tabs/windows on startup
    "browser.startup.page" = 3;
  };
in
{
  programs = {
    firefox = {
      enable = true;
      configPath = "${config.xdg.configHome}/mozilla/firefox";

      profiles = {
        personal = {
          id = 0;
          isDefault = true;
          extensions.packages = firefoxExtensions;
          settings = firefoxSettings;
        };

        worky = {
          id = 1;
          extensions.packages = firefoxExtensions;
          settings = firefoxSettings;
        };
      };
    };

    chromium = {
      enable = true;
      package = pkgs.ungoogled-chromium;
    };
  };
}
