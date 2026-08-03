{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fastfetch
    neovim
    tree
    fzf
    bat
    ripgrep
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      vim = "nvim";
      vi = "nvim";
    };
    initExtra = ''
      export PS1="\[\e[38;5;75m\]\u@\h \[\e[38;5;113m\]\w \[\e[38;5;189m\]\$ \[\e[0m\]"
      fastfetch
    '';
  };

  programs.git = {
	enable = true;

	settings = {
	  user.name = "curtself";
	  user.email = "curtself.cs@gmail.com";
	  init.defaultBranch = "main";
	  core.editor = "nvim";
	};
  };

  imports = [
    ./tmux.nix
    ./nvim.nix
  ];

 }
