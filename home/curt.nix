{ config, pkgs, ... }:

{
  imports = [
    ../modules/cli
  ];

  home = {
    username = "curt";
    homeDirectory = "/home/curt";
    stateVersion = "26.05";
  };
}
