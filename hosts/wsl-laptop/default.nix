{
  imports = [
    ../../modules/common
    ../../modules/users/curt.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = "curt";

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.curt = import ../../home/curt.nix;
  };

  system.stateVersion = "26.05";
}
