{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    colorscheme = "habamax";
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 4;
      smartindent = true;
      autoindent = true;
    };
	globals = {
	  mapleader = " ";
	  maplocalleader = " ";
	};
	#highlight = {
	#  onYank.enable = true;
	#};
  extraConfigLua = ''
    vim.api.nvim_create_autocmd("TextYankPost", {
      desc = "Highlight when yanking (copying) text",
      group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
      callback = function()
        vim.hl.on_yank()
      end,
    })
  '';
	keymaps = [
	  {
		mode = "n";
		key = "<leader>y";
		action = "\"+y";
		options.desc = "Yank to system clipboard";
	  }
	  {
		mode = "v";
		key = "<leader>y";
		action = "\"+y";
		options.desc = "Yank to system clipboard";
	  }
	  {
		mode = "v";
		key = "<";
		action = "<gv";
		options.desc = "Indent left and reselect";
	  }
	  {
		mode = "v";
		key = ">";
		action = ">gv";
		options.desc = "Indent right and reselect";
	  }
	];
  };
}
