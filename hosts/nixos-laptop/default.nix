# hosts/nixos-laptop/default.nix
{ self, config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix

    ../../modules/common
    ../../modules/users/curt.nix
    # include the desktop module later
  ];

  # Laptop-specific NixOS configuration goes here.
  home-manager = {
    users.curt = import ../../home/curt.nix;
  };

  system.configurationRevision = 
	if self ? rev then
	  self.rev
	else "dirty" ;

  system.stateVersion = "26.05";
}
