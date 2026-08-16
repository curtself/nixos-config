{ pkgs, ... }:

{
  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";

  # enable auto-mount for usb drives
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  imports = [
    "sshd.nix"
  ];
  environment.systemPackages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
