# Dotfiles

My configuration files for Niri, Neovim, etc.

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

`~/.config/scripts` must be on `PATH` for niri and waybar to find helper scripts (brightness, volume, launch-or-focus, etc.).

## Theme Switcher

Themes live in `~/.config/tinted-theming/themes/<theme>/`. Manage them with `set-theme`:

```bash
# Copy a theme's files into the config dirs (kitty, waybar, mako, niri, etc.) and reload them
set-theme apply <theme>

# Back up current config colors into the theme dir
set-theme save <theme>
```

Use [tinty](https://github.com/tinted-theming/tinty) (config in [`tinted-theming/tinty/config.toml`](tinted-theming/tinty/config.toml)) to apply new themes; its hooks copy the files into the config dirs, then `save` to keep a copy in the repo.
