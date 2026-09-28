{ pkgs, ... }:

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
      marksman = {
        enable = true;
        cmd = [
          "marksman"
          "server"
        ];
        filetypes = [ "markdown" ];
        rootMarkers = [ ".git" ];
      };
      bashls = {
        enable = true;
        cmd = [
          "bash-language-server"
          "start"
        ];
        filetypes = [
          "sh"
          "bash"
        ];
      };
    };
  };
  plugins.render-markdown = {
    enable = true;
  };

}
