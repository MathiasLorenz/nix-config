{ pkgs, username, ... }:
{
  programs = {
    nh = {
      enable = true;
      clean = {
        enable = true;
      };
    };

    _1password.enable = true; # cli
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = [ username ];
    };
  };

  environment.systemPackages = with pkgs; [
    # Elixir/Erlang. LSP is installed in neovim module
    # beam.packages.erlang_25.erlang
    beam.packages.erlang_25.elixir_1_17
    wkhtmltopdf
    inotify-tools
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "slack"
      "1password"
      "1password-cli"
      "widevine-cdm"
    ];
}
