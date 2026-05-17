#!/usr/bin/env bash

WALL_DIR="$HOME/Pictures/wallpapers"

cd "$WALL_DIR" || exit 1

# pick wallpaper
SELECTED=$(find . -maxdepth 1 -type f \
  \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.webp" \) \
  -printf "%f\n" \
  | rofi -dmenu -i -p "Wallpaper")

[[ -z "$SELECTED" ]] && exit 0

FULL_PATH="$WALL_DIR/$SELECTED"

[[ -f "$FULL_PATH" ]] || exit 1

SYMLINK="$HOME/.config/hypr/current_wallpaper"

mkdir -p "$(dirname "$SYMLINK")"
ln -sf "$FULL_PATH" "$SYMLINK"

echo "Symlink updated -> $SYMLINK -> $FULL_PATH"

# 1. wapaper
if command -v awww >/dev/null 2>&1; then
    pgrep -x awww-daemon >/dev/null || awww-daemon &
    sleep 1
    awww img "$FULL_PATH"
elif command -v swww >/dev/null 2>&1; then
    pgrep -x swww-daemon >/dev/null || swww init
    sleep 1
    swww img "$FULL_PATH" --transition-type center --transition-fps 60 --transition-duration 1
fi


# matugen
if command -v matugen >/dev/null 2>&1; then
    matugen image "$FULL_PATH"
fi

# -------------------------
# 3. SAFE RELOADS
# -------------------------
pkill -SIGUSR2 waybar 2>/dev/null

pidof kitty >/dev/null && kill -SIGUSR1 "$(pidof kitty)"

hyprctl reload 2>/dev/null

echo "Wallpaper: $FULL_PATH"
