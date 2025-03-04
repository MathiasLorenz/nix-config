# NixOS Config

My NixOS config :)

## Manuals

```sh
man configuration.nix
man home-configuration.nix
```

## Installation

- Create boot USB drive and install
- Boot into system
- Create SSH key and add to GitHub
- Clone this repo
  - Add packages with `nix-shell -p git vim`
  - `git clone nix-config`
  - `git clone lazyvim-config`
- cd into nix-config
- `mkdir hosts/<new-system-name>`
- `cp /etc/nixos/hardware-configuration.nix hosts/new-system-name`
- copy home.nix and configuration.nix from other system and tweak as needed
  - most importantly remember to update system name
- add system to `flake.nix`
  - be very diligent about changing all references to new system
- `sudo nixos-rebuild build --flake .#new-system-name`
- If things are good, run same as above but with switch instead of build
- reboot and then, (hopefully) profit!
- commit and push new system to github
- symlink [lazyvim-config](https://github.com/MathiasLorenz/lazyvim-config) to system, see readme there

## Debugging failed home-manager generation

To see the logs of failed home-manager service, see

```sh
journalctl --unit home-manager-mlorenz.service | bat
```

and go to the end of the file.
