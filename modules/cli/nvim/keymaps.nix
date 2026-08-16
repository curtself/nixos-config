{ ... }:

{
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
    #{
    #  mode = "n";
    #  key = "<leader>f";
    #  action = "<cmd>lua require('conform').format()<CR>";
    #  options.desc = "Format buffer";
    #}
  ];
}
