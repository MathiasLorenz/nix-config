{ ... }:
{
  # Add widewine to chromium to be able to watch DRM content (e.g. waoo.tv, apple tv+)
  # This is an unfree package, unfortunately!
  nixpkgs.overlays = [
    (final: prev: { chromium = prev.chromium.override { enableWideVine = true; }; })
  ];
}
