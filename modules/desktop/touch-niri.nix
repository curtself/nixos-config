{ pkgs, ... }:
let
  niri-tablet-repo = pkgs.fetchFromGitHub {
    owner = "GGEZUS";
    repo = "niri-tablet";
    rev = "v26.04.18";
    hash = ""; # Leave empty on first run; Nix will fail and provide the correct hash
  };

  niri-tablet = pkgs.niri.overrideAttrs (previousAttrs: {
      postPatch = (previousAttrs.postPatch or "") + ''
        echo "Applying GGEZUS niri-tablet patches..."
        # Shell globbing automatically applies 0001, 0002, etc. in numerical order
        for patch_file in ${niri-tablet-repo}/pkg/*.patch; do
          echo "Applying $patch_file"
          patch -Np1 < "$patch_file"
        done
      '';
    });
in
{
 programs.niri.package = niri-tablet;
}


