# hosts/nixos-laptop/default.nix
{ self, config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix

    ../../modules/common
    ../../modules/users/curt.nix
    # include the desktop module later
	../../modules/desktop
  ];

  # Laptop-specific NixOS configuration goes here.
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "nixos-laptop";
  networking.networkmanager.enable = true;
  networking.wireless.enable = true;
  time.timeZone = "America/Los_Angeles";

  home-manager = {
    users.curt = import ../../home/curt.nix;
  };

  system.configurationRevision = 
	if self ? rev then
	  self.rev
	else "dirty" ;

  system.stateVersion = "26.05";
}
