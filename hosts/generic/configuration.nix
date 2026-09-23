# /etc/nixos/configuration.nix file to use before running nixos-install
{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # uncomment lines below if you are configuring remotely via ssh
  #services.openssh.enable = true;
  #services.openssh.settings.PasswordAuthentication = true;
  #services.openssh.settings.PermitRootLogin = "yes";

  time.timeZone = "America/Los_Angeles";

  environment.systemPackages = with pkgs; [
    git
  ];

  system.stateVersion = "26.05";
}
