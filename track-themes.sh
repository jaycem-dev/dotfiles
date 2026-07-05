#!/usr/bin/env bash

# Ensure script runs from the dotfiles repo root
REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null)"
if [ -z "$REPO_ROOT" ]; then
    echo "Error: Not inside the dotfiles git repository."
    exit 1
fi
cd "$REPO_ROOT" || exit 1

# List of all theme files (relative to repo root)
FILES=(
    "btop/.config/btop/themes/colors.theme"
    "yazi/.config/yazi/flavors/colors.yazi/flavor.toml"
    "yazi/.config/yazi/flavors/colors.yazi/tmtheme.xml"
    "fuzzel/.config/fuzzel/colors.ini"
    "kitty/.config/kitty/current-theme.conf"
    "mako/.config/mako/colors"
    "niri/.config/niri/colors.kdl"
    "nvim/.config/nvim/lua/plugins/theme.lua"
    "swaylock/.config/swaylock/config"
    "waybar/.config/waybar/colors.css"
    "bat/.config/bat/config"
    "bat/.config/bat/themes"
    "fish/.config/fish/conf.d/theme.fish"
    "fish/.config/fish/themes"
    "fish/.config/fish/conf.d/fzf-theme.fish"
)

skip_updates() {
    echo "Marking ${#FILES[@]} files to skip worktree..."
    git update-index --skip-worktree "${FILES[@]}" 2>/dev/null
    echo "Done."
}

restore_tracking() {
    echo "Restoring tracking for ${#FILES[@]} files..."
    git update-index --no-skip-worktree "${FILES[@]}" 2>/dev/null
    echo "Done."
}

case "$1" in
skip)
    skip_updates
    ;;
track)
    restore_tracking
    ;;
*)
    echo "Usage: $0 {skip|track}"
    echo "  skip:  Ignore local updates to theme files"
    echo "  track: Resume tracking updates to theme files"
    echo ""
    echo "Managed files (${#FILES[@]} total):"
    for file in "${FILES[@]}"; do
        echo "  - $file"
    done
    exit 1
    ;;
esac
