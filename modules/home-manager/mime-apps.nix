{ ... }:
{
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "application/pdf" = "zathura";
      "application/x-pdf" = "zathura";
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };
  };
}
