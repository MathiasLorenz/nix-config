{ ... }:
{
  programs.claude-code = {
    enable = true;
    settings = {
      theme = "dark";
    };
  };

  programs.opencode = {
    enable = true;
    settings = {
      autoupdate = false;
    };
  };
}
