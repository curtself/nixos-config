{ pkgs, ... }:

{
  programs.nixvim = {
	enable = true;
	colorscheme = "habamax";

	imports = [
	  ./options.nix
	  ./keymaps.nix
	  ./lsp.nix
	];
  };
}
