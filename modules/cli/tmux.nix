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
	  {
		plugin = resurrect;
		extraConfig = ''
		  set -g @resurrect-save 'on'
		  set -g @resurrect-restore 'on'
		  set -g @resurrect-capture-pane-contents 'on'
		'';
	  }
	  {
		plugin = continuum;
		extraConfig = ''
		  set -g @continuum-restore 'on'
		  set -g @continuum-boot 'on'
		  set -g @continuum-save-interval '10'
		'';
	  }
    ];
    extraConfig = ''
      # set clipboard stuff
      set -g allow-passthrough on

      # ensure window indexes get reordered on close/delete
      set-option -g renumber-windows on

	  # fix prefix indicator for nixos - themes seemingly cannot do this correctly on nixos so this line is needed.
	  set -g status-left '#{?client_prefix,#[fg=#ff757f],#[fg=#868686]}#[bg=#222436]  ' 

	  # Split windows (opens in same directory)
	  unbind %
	  bind | split-window -h -c "#{pane_current_path}"

	  unbind '"'
	  bind - split-window -v -c "#{pane_current_path}"

	  # Alt+hjkl to switch panes without prefix
	  bind -n M-h select-pane -L
	  bind -n M-j select-pane -D
	  bind -n M-k select-pane -U
	  bind -n M-l select-pane -R

	  # Shift Left/Right to navigate windows
	  bind -n S-Left previous-window
	  bind -n S-Right next-window

	  # these binding need to be here so they load AFTER the resurrect plugin config
   	  set -g @resurrect-save 'C-s'
	  set -g @resurrect-restore 'C-r'
 '';
  };
}
