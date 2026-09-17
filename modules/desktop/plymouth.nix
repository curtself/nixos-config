{ pkgs, ... }:

let
  circleHud = pkgs.stdenvNoCC.mkDerivation {
    pname = "plymouth-theme-circle-hud";
    version = "unstable";

    src = pkgs.fetchFromGitHub {
      owner = "adi1090x";
      repo = "plymouth-themes";
      rev = "5d8817458d764bff4ff9daae94cf1bbaabf16ede";
      hash = ""; # Leave empty on first run; Nix will fail and provide the correct hash
    };

    installPhase = ''
      mkdir -p $out/share/plymouth/themes/circle_hud
      cp -r pack_1/circle_hud/* $out/share/plymouth/themes/circle_hud/
    '';
  };
in
{
  boot.plymouth = {
    enable = true;
    theme = "circle_hud";
    themePackages = [ circleHud ];
  };

  boot.consoleLogLevel = 3;
  boot.initrd.verbose = false;
  boot.kernelParams = [
    "quiet"
    "rd.udev.log_level=3"
    "rd.systemd.show_status=auto"
  ];
}
