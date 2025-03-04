{
  description = "Nixos with flakes experiment";

  inputs = {
    # setup stable nixpkgs
    # see https://nixos-and-flakes.thiscute.world/nixos-with-flakes/downgrade-or-upgrade-packages
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";

    # setup unstable nixpkgs
    # make this the default package repo
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # setup home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
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
      nixpkgs-stable,
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
            pkgs-stable = import nixpkgs-stable;
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
              home-manager.users.${username} = import ./modules/home-manager/home.nix;
              home-manager.extraSpecialArgs = {
                inherit username;
              };
            }
          ];
        };
        terry = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit username;
            inherit fullname;
            pkgs-stable = import nixpkgs-stable;
          };
          modules = [
            ./hosts/terry/configuration.nix
            nixos-hardware.nixosModules.framework-13-7040-amd

            # setup home-manager as a module
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${username} = import ./modules/home-manager/home.nix;
              home-manager.extraSpecialArgs = {
                inherit username;
              };
            }
          ];
        };
      };
    };
}
