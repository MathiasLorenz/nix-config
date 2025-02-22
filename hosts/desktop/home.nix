{ config, pkgs, ... }:

let
  username = "mlorenz";
  homePath = "/home/${username}";
in
{
  imports = [
    ../../modules/home-manager/fish.nix
    ../../modules/home-manager/ghostty.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = username;
  home.homeDirectory = homePath;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    btop
    zathura
    wl-clipboard
    wget
    bat
    nix-zsh-completions
    curl
    fastfetch
    fd
    ncdu
    vim
    # neovim
    wl-clipboard
    ripgrep
    go-task
    gawk
    tldr
    # stow # Installed with pacman as we need this to bootstrap nixkpgs
    # kdePackages.plasma-wayland-protocols # needed to launch KDE plasma with Wayland, installed with pacman
    unzip
    nodejs_23
    magic-wormhole
    brightnessctl # Backlight control
    # flyctl
    # tenv
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

    # Installed with pacman instead (as it comes bundled in EndeavourOS)
    # pavucontrol # pulse audio volume control

    # Better to just install these with pacman...
    # slack # slack-desktop-wayland in paru
    # _1password-gui # 1password in paru
    # bitwarden-desktop # bitwarden in paru
    # _1password-cli

    gcc
    lua5_1
    luarocks
    uv
    rustup
    zig
    openblas
 
    # Already bundled with pacman
    # git

    # This does not work currently :(
    # containerd
    # docker
    # docker-buildx
    # dive

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

    wlr-randr
    rofi-wayland

    # Use this to install programs needing graphics card / opengl by spawning them with
    # the nixGL wrapper
    # (config.lib.nixGL.wrapOffload pkgs.qutebrowser)

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

  programs.qutebrowser = {
    enable = true;
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  # home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  # };

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "slack"
      "1password"
      "1password-cli"
    ];
  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/mlorenz/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
