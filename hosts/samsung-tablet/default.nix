# hosts/samsung-tablet/default.nix
{
  self,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix

    ../../modules/common
    ../../modules/users/curt.nix
    # include the desktop module
    ../../modules/desktop
    # touch-related niri patches
    ../../modules/desktop/touch-niri.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = [ "i915" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelPatches = [
    {
      name = "samsung-sam0201-lis2hh12";
      patch = ../../modules/desktop/samsung-tablet-accel.patch;
    }
  ];
  networking.hostName = "samsung-tablet";
  networking.networkmanager.enable = true;
  networking.wireless.enable = true;
  time.timeZone = "America/Los_Angeles";

  home-manager = {
    users.curt = import ../../home/curt.nix;
  };

  system.configurationRevision = if self ? rev then self.rev else "dirty";

  system.stateVersion = "26.05";
}
