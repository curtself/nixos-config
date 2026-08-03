{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
	extraPlugins = [ pkgs.vimPlugins.gruvbox ];
    colorscheme = "habamax";
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 4;
      smartindent = true;
      autoindent = true;
    };
  };
}
