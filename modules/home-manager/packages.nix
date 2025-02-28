{ pkgs, ... }:
{
  programs = {
    btop = {
      enable = true;
      settings = {
        color_theme = "ayu";
        theme_background = true;
        vim_keys = true;
        update_ms = 500;
        proc_sorting = "cpu lazy";
      };
    };

    bat = {
      enable = true;
      # Stolen from zanderhavgaard config
      config = {
        pager = "less -FR";
        theme = "OneHalfDark";
      };
    };

    # Fast tldr alternative
    tealdeer = {
      enable = true;
      settings = {
        updates = {
          auto_update = true;
        };
      };
    };

    zathura = {
      enable = true;
      options = {
        selection-clipboard = "clipboard";
        recolor-lightcolor = "#282C34";
        recolor-darkcolor = "#efefef";
      };
    };
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # CLI packages
    wget
    curl
    fastfetch
    fd
    ncdu
    vim
    ripgrep
    go-task
    magic-wormhole
    brightnessctl # Backlight control
    traceroute
    dig
    jq
    yq-go
    eza
    nitch
    grc
    yazi
    amdgpu_top
    patchelf
    gnumake

    # Work stuff, could be its own nix file
    tenv

    # Graphical applications
    bitwarden-desktop
    bitwarden-cli
    signal-desktop
    slack

    # Compiler stuff
    gcc
    lua5_1
    luarocks
    uv
    rustup
    zig
    valgrind
    gdb

    # Git stuff
    gh
    lazygit

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
}
