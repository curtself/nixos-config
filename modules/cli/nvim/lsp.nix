{ ... }:

{
  plugins.lsp = {
    enable = true;

    servers = {
      gopls = {
        enable = true;
        cmd = [ "gopls" ];
        filetypes = [
          "go"
          "gomod"
          "gowork"
          "gotmpl"
        ];
        rootMarkers = [
          "go.mod"
          "go.work"
          ".git"
        ];
      };
      nixd = {
        enable = true;
        rootMarkers = [ "flake.nix" ];
        cmd = [ "nixd" ];
        filetypes = [ "nix" ];
      };
    };
  };
}
