{ config, pkgs, ... }:

{
  imports = [
    ../modules/cli
  ];

  services.udiskie = {
      enable = true;
      settings = {
          # workaround for
          # https://github.com/nix-community/home-manager/issues/632
          program_options = {
              # replace with your favorite file manager
              file_manager = "${pkgs.nemo-with-extensions}/bin/nemo";
          };
      };
  };

  home = {
    username = "curt";
    homeDirectory = "/home/curt";
    stateVersion = "26.05";
  };
}
