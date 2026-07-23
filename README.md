# Dotfiles

My configuration files for Niri, Neovim, etc.

## Screenshot (may be outdated)

![screenshot](screenshot.avif)

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

Switch themes with `theme-switcher` (select via fzf) or `theme-switcher <theme-name>`.

## Tracking Theme Files

**Usage:**

```bash
# Ignore local updates to theme files
./track-themes.sh skip

# Resume tracking (if you want to commit theme changes)
./track-themes.sh track

# Show usage and list managed files
./track-themes.sh
```
