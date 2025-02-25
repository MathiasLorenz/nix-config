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
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    zathura
    wl-clipboard
    wget
    curl
    fastfetch
    fd
    ncdu
    vim
    wl-clipboard
    ripgrep
    go-task
    gawk
    unzip
    nodejs_23
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
    valgrind
    gdb

    # rocm-cli for AMD gpus, see https://cgmb-rocm-docs.readthedocs.io/en/latest/ROCm_System_Managment/ROCm-SMI-CLI.html
    amdgpu_top
    patchelf
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

    grim # screenshots
    slurp # select region in wayland, used together with screenshots

    # Login manager
    # Rememeber to disable other login managers if present
    # On EndevourOS this is lightdm, so:
    #   systemctl disable lightdm
    #   systemctl enable ly
    # and restart system (or stop/start the two services)
    # ly # needs systemd stuff, installed with pacman instead
    # NOTE: This actually breaks log in to xfce.... You can of course revert the above
    # to remedy this

    # Using asdf-vm turned out to be a shit show, this worked surprisingly well
    # beamMinimal25Packages.elixir_1_17
    # wkhtmltopdf

    blueman

    pavucontrol # pulse audio volume control

    bitwarden-desktop
    bitwarden-cli

    gcc
    lua5_1
    luarocks
    uv
    rustup
    zig
    openblas

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

    gh
    hub
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
