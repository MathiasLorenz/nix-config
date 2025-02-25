# NixOS Config

My NixOS config :)

## Manuals

```sh
man configuration.nix
man home-configuration.nix
```

## Debugging failed home-manager generation

To see the logs of failed home-manager service, see

```sh
journalctl --unit home-manager-mlorenz.service | bat
```

and go to the end of the file.
