{ pkgs, ... }:

let
  catppuccinSddm = pkgs.catppuccin-sddm.override {
    flavor = "mocha";
    accent = "mauve";
    font = "Noto Sans";
    fontSize = "9";
    loginBackground = true;
  };
in
{
  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    theme = "${catppuccinSddm}/share/sddm/themes/catppuccin-mocha-mauve";
  };
}
