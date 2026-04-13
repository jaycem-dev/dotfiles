if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting
end

set -gx EDITOR nvim
fish_add_path -g $HOME/.local/bin
