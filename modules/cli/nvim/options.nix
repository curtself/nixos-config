{ ... }:

{
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

  # do highlighting on yank
  extraConfigLua = ''
	vim.api.nvim_create_autocmd("TextYankPost", {
	  desc = "Highlight when yanking (copying) text",
	  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	  callback = function()
		vim.hl.on_yank()
	  end,
	})
  vim.keymap.set("n", "<leader>f", function()
    if vim.bo.filetype == "nix" then
      local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
      local input = table.concat(lines, "\n") .. "\n"

      vim.system(
        { "nixfmt" },
        { stdin = input, text = true },
        function(result)
          if result.code ~= 0 then
            vim.notify(result.stderr, vim.log.levels.ERROR)
            return
          end

          vim.schedule(function()
            local formatted = vim.split(result.stdout, "\n", { plain = true })
            if formatted[#formatted] == "" then
              table.remove(formatted)
            end
            vim.api.nvim_buf_set_lines(0, 0, -1, false, formatted)
          end)
        end
      )
    elseif vim.bo.filetype == "go" then
      vim.lsp.buf.format()
    end
  end, { desc = "Format buffer" })
  '';
}
