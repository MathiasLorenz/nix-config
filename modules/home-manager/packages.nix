{ pkgs, pkgs-stable, ... }:
let
  google-cloud-sdk-with-gke-auth = pkgs-stable.google-cloud-sdk.withExtraComponents (
    with pkgs-stable.google-cloud-sdk.components;
    [
      gke-gcloud-auth-plugin
    ]
  );
in
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
    nix-tree
    unzip
    glow # cli markdown tool
    pdfgrep
    bitwarden-cli
    dive
    hydra-check
    eva # calculator

    # Work stuff, could be its own nix file
    tenv
    postgresql_17_jit # Dunno why an non-jit version wasn't available for psql 17
    beam.packages.erlang_27.elixir_1_18
    wkhtmltopdf
    inotify-tools
    python312
    postman
    kubectl
    kubectl-cnpg
    k9s
    google-cloud-sdk-with-gke-auth
    kubeconform

    # Graphical applications
    bitwarden-desktop
    signal-desktop-bin
    slack
    qbittorrent
    vlc

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
