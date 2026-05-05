#!/usr/bin/env bash

# Ensure script runs from the dotfiles repo root
REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null)"
if [ -z "$REPO_ROOT" ]; then
    echo "Error: Not inside the dotfiles git repository."
    exit 1
fi
cd "$REPO_ROOT" || exit 1

# List of all matugen output files (relative to repo root)
# Add/remove files according to matugen config
FILES=(
    "kitty/.config/kitty/themes/Colors.conf"
    "btop/.config/btop/themes/colors.theme"
    "fuzzel/.config/fuzzel/colors.ini"
    "mako/.config/mako/colors"
    "gtk/.config/gtk-3.0/colors.css"
    "gtk/.config/gtk-4.0/colors.css"
    "waybar/.config/waybar/colors.css"
    "yazi/.config/yazi/theme.toml"
    "niri/.config/niri/colors.kdl"
    "foot/.config/foot/colors.ini"
    "nvim/.config/nvim/lua/plugins/theme.lua"
    "helix/.config/helix/themes/colors.toml"
    "swaylock/.config/swaylock/config"
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
    echo "  skip:  Ignore local updates to matugen theme files"
    echo "  track: Resume tracking updates to matugen theme files"
    echo ""
    echo "Managed files (${#FILES[@]} total):"
    for file in "${FILES[@]}"; do
        echo "  - $file"
    done
    exit 1
    ;;
esac
