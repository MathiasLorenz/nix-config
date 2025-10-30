{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.hack
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-lgc-plus
    noto-fonts-color-emoji
    noto-fonts
  ];
}
