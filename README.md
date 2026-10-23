# Dotfiles

My configuration files for Hyprland, Neovim, etc.

## Usage

- Clone the repo and cd into it:

```bash
git clone https://github.com/jaycem-dev/dotfiles.git ~/Projects/dotfiles && cd ~/Projects/dotfiles
```

- Symlink with stow:

```bash
# All packages
stow .

# Specific package
stow nvim
```

## Requirements

`~/.config/scripts` must be on `PATH`.
