{ ... }:
{
  # Add widewine to qutebrowser to be able to watch DRM content (e.g. waoo.tv)
  # This is an unfree package, unfortunately!
  nixpkgs.overlays = [
    (final: prev: { qutebrowser = prev.qutebrowser.override { enableWideVine = true; }; })
  ];
}
