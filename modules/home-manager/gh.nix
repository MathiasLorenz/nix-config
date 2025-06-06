{ ... }:
{
  programs.gh = {
    enable = true;

    hosts = {
      "github.com" = {
        user = "MathiasLorenz";
      };
    };

    settings = {
      git_protocol = "ssh";
      prompt = "enabled";
      color_lables = "enabled";
      spinner = "enabled";
    };
  };
}
