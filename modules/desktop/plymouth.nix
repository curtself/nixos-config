{ pkgs, ... }:

{
  boot.plymouth = {
    enable = true;
    theme = "circle_hud";
    themePackages = [ pkgs.adi1090x-plymouth-themes ];
  };

  boot.consoleLogLevel = 3;
  boot.initrd.verbose = false;
  boot.kernelParams = [
    "quiet"
    "rd.udev.log_level=3"
    "rd.systemd.show_status=auto"
  ];
}
