# Dotfiles

My configuration files for Niri, Neovim, etc.

## Screenshot (may be outdated)

![screenshot](screenshot.png)

## Usage

- Clone the repo and cd into it:

```bash
git clone https://github.com/jaycem-dev/dotfiles.git ~/dev/dotfiles && cd ~/dev/dotfiles
```

- Symlink modules with stow:

```bash
# All packages
stow */

# Specific package
stow nvim
```
