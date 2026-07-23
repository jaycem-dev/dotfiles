if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting
end

set -gx EDITOR "nvim"
set -gx TERMINAL "kitty -1"
set -gx PAGER "nvim +Man!"
set -gx BROWSER "brave"
set -gx npm_config_userconfig "$HOME/.config/npm/.npmrc"

fish_add_path -g $HOME/.config/scripts
