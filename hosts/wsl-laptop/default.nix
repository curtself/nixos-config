{ self, config, pkgs, ... }:
{
  imports = [
    ../../modules/common
    ../../modules/users/curt.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = "curt";

  # likely only WSL hosts will need wl-clipboard (for neovim)
  environment.systemPackages = with pkgs; [
	wl-clipboard
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.curt = import ../../home/curt.nix;
  };

  system.configurationRevision = 
	if self ? rev then
	  self.rev
	else "dirty" ;

  system.stateVersion = "26.05";
}
