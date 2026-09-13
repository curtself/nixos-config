{
  self,
  config,
  pkgs,
  ...
}:
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

  #environment.variables = {
  #  XDG_RUNTIME_DIR = "/mnt/wslg/runtime-dir";
  #  WAYLAND_DISPLAY = "wayland-0";
  #};

  #systemd.tmpfiles.rules = [
  #  "L+ /run/user/1000/wayland-0 - - - - /mnt/wslg/runtime-dir/wayland-0"
  #];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.curt = import ../../home/curt.nix;
  };

  system.configurationRevision = if self ? rev then self.rev else "dirty";

  system.stateVersion = "26.05";
}
