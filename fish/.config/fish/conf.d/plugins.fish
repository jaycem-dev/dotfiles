# Change directory widget, exclude folders
set -gx FZF_ALT_C_OPTS "
--walker-skip .git,node_modules,target,Library,Applications,Pictures,Music,.local,.cache,.Trash
--preview 'eza --tree --level=2 --color=always --icons=always {} | head -198'
"

# Fzf files widget, exclude folders and preview with bat
set -gx FZF_CTRL_T_OPTS "
--walker-skip .git,node_modules,target,Library,Applications,Pictures,Music,.local,.cache,.Trash
--preview 'bat -n --color=always {}'
"

# Remap fzf shortcut to change directory to CTRL-Z
bind \cZ fzf-cd-widget
bind --mode insert \cZ fzf-cd-widget

# load fzf keybinds
fzf --fish | source

# load zoxide
zoxide init fish | source

# yazi wrapper to autocd on exit
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
