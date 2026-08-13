# hosts/nixos-laptop/default.nix
{ self, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix

    ../../modules/common
    ../../modules/users/curt.nix
  ];

  # Laptop-specific NixOS configuration goes here.
# Bootloader.
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "proxmox-nix";
  networking.networkmanager.enable = true;

  home-manager = {
    users.curt = import ../../home/curt.nix;
  };

  system.configurationRevision = 
	if self ? rev then
	  self.rev
	else "dirty" ;

  system.stateVersion = "26.05";
}
