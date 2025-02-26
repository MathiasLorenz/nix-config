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
    libnotify

    # rocm-cli for AMD gpus, see https://cgmb-rocm-docs.readthedocs.io/en/latest/ROCm_System_Managment/ROCm-SMI-CLI.html
    # rocmPackages.rocm-smi
    # Installed with paru instead as 'llama.cpp-hip(-git)' which comes with all the extras for GPU support
    # The llama-cpp package is with CPU support only, so I'll build it from scratch instead
    # llama-cpp
    # rocmPackages.hip-common
    # rocmPackages.hipblas
    # rocmPackages.rocblas
    # rocmPackages.rocm-runtime
    # rocmPackages.rocm-smi
    # rocmPackages.rocminfo
    # rocmPackages.rocprofiler
    # aocl-utils

    # Using asdf-vm turned out to be a shit show, this worked surprisingly well
    # beamMinimal25Packages.elixir_1_17
    # wkhtmltopdf

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

    # Currently I can't get sway to work with home-manager
    # The problem is that wlroots can't launch as it is looking for
    # EGL extensions (OpenGL)
    # Should be fixable... For now sway can be installed with pacman/paru
    # nixGL https://github.com/nix-community/nixGL should definitly be able to solve the issue
    # but I cannot get it to work....
    # See 'GPU on non-NixOS systems' here https://nix-community.github.io/home-manager/
    # This should be the same for all gpu powered programs (like ghostty I suppose)
    # sway
    # ghostty

    # The sway 'downstream' dependencies can still be installed with home-manager
    # swaybg
    # swayidle
    # swaylock # Even when using the correct password I can't unluck with this - it works if installed with pacman..
    # waybar
    # mako
    # swayimg

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
