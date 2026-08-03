{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    mouse = true;
    baseIndex = 1;
    keyMode = "vi";
    terminal = "screen-256color";
    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = rose-pine;
	extraConfig = ''
	  set -g @rose_pine_variant 'main'
	  set -g @rose_pine_disable_active_window_menu 'on'
	  set -g @rose_pine_directory 'on'
	'';
      }
      {
        plugin = tmux-sessionx;
	extraConfig = ''
	  set -g @sessionx-bind 'o'
	'';
      }
    ];
    extraConfig = ''
      # set clipboard stuff
      set -g allow-passthrough on
      set-option -g allow-rename on
      # ensure window indexes get reordered on close/delete
      set-option -g renumber-windows on
    '';
  };
}
