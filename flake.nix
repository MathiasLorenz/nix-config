{
  description = "Nixos with flakes experiment";

  inputs = {
    # setup stable nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    # setup unstable nixpkgs
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # setup home-manager
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      # make home-manager use the same nixpkgs as the flake
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # community hardware configurations
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # build neovim from git
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs =
    inputs@{
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nixos-hardware,
      neovim-nightly-overlay,
      ...
    }:
    let
      system = "x86_64-linux";
      username = "mlorenz";
      fullname = "Mathias Lorenz";
    in
    {
      nixosConfigurations = {
        claude = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit username;
            inherit fullname;
            pkgs-unstable = import nixpkgs-unstable;
          };
          modules = [
            ./hosts/claude/configuration.nix
            nixos-hardware.nixosModules.common-cpu-amd
            nixos-hardware.nixosModules.common-cpu-amd-pstate
            nixos-hardware.nixosModules.common-cpu-amd-zenpower
            nixos-hardware.nixosModules.common-gpu-amd
            nixos-hardware.nixosModules.common-pc
            nixos-hardware.nixosModules.common-pc-ssd

            # setup home-manager as a module
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${username} = import ./hosts/claude/home.nix;
              home-manager.extraSpecialArgs = {
                inherit username;
              };
            }
          ];
        };
      };
    };
}
