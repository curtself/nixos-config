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
	  {
		mode = "n";
		key = "<Esc>";
		action = ":nohlsearch<CR>";
		options.desc = "Clear search highlight";
	  }
	  {
		mode = "n";
		key = "<C-d>";
		action = "<C-d>zz";
		options.desc = "Center after page down";
	  }
	  {
		mode = "n";
		key = "<C-u>";
		action = "<C-u>zz";
		options.desc = "Center after page up";
	  }
	  {
		mode = "n";
		key = "Q";
		action = "<nop>";
		options.desc = "Q is very bad key to hit accidentally";
	  }
	  {
		mode = "n";
		key = "<leader>d";
		action = "\"_d";
		options.desc = "Delete into the void (normal)";
	  }
	  {
		mode = "v";
		key = "<leader>d";
		action = "\"_d";
		options.desc = "Delete into the void (visual)";
	  }
	];
  };
}
