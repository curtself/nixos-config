{ ... }:

{
  keymaps = [
    {
      mode = "n";
      key = "<leader>cd";
      action = ":Ex<CR>";
      options.desc = "Explore command";
    }
    {
      mode = "n";
      key = "<leader>rc";
      action = ":e ~/nixos-config/modules/cli/nvim/default.nix<CR>";
      options.desc = "Edit config";
    }
    {
      mode = "i";
      key = "jj";
      action = "<ESC>";
      options.desc = "Allows jj to enter normal mode";
    }
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options.desc = "Move to left windows";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options.desc = "Move to bottom window";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options.desc = "Move to top window";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options.desc = "Move to right window";
    }
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
    # The actual <leader>f binding is defined in options.nix due to complexity with some LSP servers
    #{
    #  mode = "n";
    #  key = "<leader>f";
    #  action = "<cmd>lua require('conform').format()<CR>";
    #  options.desc = "Format buffer";
    #}
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>lua vim.diagnostic.open_float()<CR>";
      options.desc = "Show diagnostic";
    }
    {
      mode = "n";
      key = "[d";
      action = "<cmd>lua vim.diagnostic.goto_prev()<CR>";
      options.desc = "Previous diagnostic";
    }
    {
      mode = "n";
      key = "]d";
      action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
      options.desc = "Next diagnostic";
    }
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<CR>";
      options.desc = "Find files";
    }
    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>Telescope live_grep<CR>";
      options.desc = "Live grep";
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd>Telescope buffers<CR>";
      options.desc = "Find buffers";
    }
    {
      mode = "n";
      key = "<leader>fh";
      action = "<cmd>Telescope help_tags<CR>";
      options.desc = "Help";
    }
  ];
}
