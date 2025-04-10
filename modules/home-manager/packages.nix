{ pkgs, pkgs-stable, ... }:
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
        proc_tree = true;
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

    firefox = {
      enable = true;
    };

    chromium = {
      enable = true;
      commandLineArgs = [
        "--enable-features=AcceleratedVideoDecodeLinuxZeroCopyGL,AcceleratedVideoDecodeLinuxGL,VaapiIgnoreDriverChecks"
        "--ignore-gpu-blocklist"
        "--enable-zero-copy"
        "--ozone-platform-hint=auto"
        "--use-angle=vulkan" # This makes hardware decode work on my desktop
      ];
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
    ipcalc
    whois

    # Work stuff, could be its own nix file
    tenv
    postgresql_17_jit # Dunno why an non-jit version wasn't available for psql 17
    # Elixir/Erlang. LSP is installed in neovim module
    # erlang 25 has been removed from unstable, so adding it below as stable until downstream project is updated
    # beam.packages.erlang_25.elixir_1_17
    wkhtmltopdf
    inotify-tools

    # Graphical applications
    bitwarden-desktop
    bitwarden-cli
    signal-desktop
    slack
    teams-for-linux

    # Compiler stuff
    gcc
    lua5_1
    luarocks
    uv
    rustup
    zig
    valgrind
    gnumake
    cmake
    ccache
    gdb

    # Git stuff
    gh
    lazygit

    # Stable shit
    # The below could probably work instead of the `pkgs.buildEnv` thingy
    # pkgs-stable.beam.packages.erlang_25.elixir_1_17
    (pkgs.buildEnv {
      name = "stable-package-wrapper";
      paths = [ pkgs-stable.beam.packages.erlang_25.elixir_1_17 ];
      # Force it to ignore conflicts (use with caution)
      ignoreCollisions = true;
    })
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
