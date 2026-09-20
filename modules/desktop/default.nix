{
  pkgs,
  lib,
  zen-browser,
  inputs,
  ...
}:

{
  imports = [
    ./sddm.nix
	./plymouth.nix
  ];

  services.xserver = {
    enable = true;
    #windowManager.qtile.enable = true;
  };

  programs.firefox.enable = true;
  programs.dms-shell = {
    enable = true;
    systemd.enable = true;
  };
  programs.niri = {
    enable = true;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.swaylock = { };

  environment.systemPackages = with pkgs; [
	acpi
    fuzzel
    alacritty
    swaylock
    swayidle
    mako
    xwayland-satellite
    rofi
    cliphist
    wl-clipboard
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

}
