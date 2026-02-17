{
  inputs,
  pkgs,
  ...
}:
{
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;

      package = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default;

      # enable providers for plugins in other languages than lua
      # withPython3 = true;
      # withNodeJs = true;
    };
  };

  # neovim dependencies
  environment.systemPackages = with pkgs; [
    tree-sitter
    gcc
    lua5_1
    lua51Packages.tiktoken_core
    # TODO: figure which is the right tiktoken package for neovim
    # lua
    # luaPackages.tiktoken_core
    # luajitPackages.tiktoken_core
    luajit
    luarocks
    lynx
    viu
    chafa
    nodejs
    cargo
    lazygit
    ripgrep
    fd

    # WIP: not sure that all of these are picked up correctly by neovim
    # lsp/linters/etc.
    bash-language-server
    black
    docker-compose-language-service
    dockerfile-language-server
    hadolint
    helm-ls
    lua-language-server
    nodePackages.vscode-json-languageserver
    # markdown-toc # TODO: what is the packge name?
    markdownlint-cli2 # TODO: this is not recognized
    marksman
    nil
    nixd
    nixfmt
    nodePackages.prettier
    zls

    # python
    python3Packages.debugpy
    python3
    pyright
    ruff
    ty
    pyrefly
    basedpyright

    shellcheck
    shfmt
    sqlfluff
    stylua
    taplo
    # terraform is non-free fuck that
    terraform-ls
    tflint
    yaml-language-server

    # elixir
    beam.packages.erlang_28.elixir-ls
    lexical
    next-ls
  ];
}
