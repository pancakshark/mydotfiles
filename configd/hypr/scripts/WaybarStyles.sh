#!/bin/bash

IFS=$'\n\t'

# -----------------------------
# directories
# -----------------------------
WAYBAR_CONFIGS="$HOME/.config/waybar/configs"
WAYBAR_STYLES="$HOME/.config/waybar/style"

# active symlinks
WAYBAR_CONFIG_LINK="$HOME/.config/waybar/config.jsonc"
WAYBAR_STYLE_LINK="$HOME/.config/waybar/style.css"

SCRIPTSDIR="$HOME/.config/hypr/scripts"
ROFI_CONFIG="$HOME/.config/rofi/config.rasi"

# -----------------------------
# messages
# -----------------------------
STYLE_MSG='Choose Waybar Style'
CONFIG_MSG='Choose Waybar Config'

# -----------------------------
# style menu
# -----------------------------
style_menu() {
    find "$WAYBAR_STYLES" \
        -maxdepth 1 \
        -type f \
        -name '*.css' \
        -printf '%f\n' |
        sed 's/\.css$//' |
        sort
}

# -----------------------------
# config menu
# -----------------------------
config_menu() {
    find "$WAYBAR_CONFIGS" \
        -maxdepth 1 \
        -type f \
        \( -name '*.jsonc' -o -name '*.json' \) \
        -printf '%f\n' |
        sed 's/\.jsonc$//' |
        sed 's/\.json$//' |
        sort
}

# -----------------------------
# apply style
# -----------------------------
apply_style() {
    local style="$1"

    ln -sf \
        "$WAYBAR_STYLES/$style.css" \
        "$WAYBAR_STYLE_LINK"
}

# -----------------------------
# apply config
# -----------------------------
apply_config() {
    local config="$1"

    if [[ -f "$WAYBAR_CONFIGS/$config.jsonc" ]]; then
        ln -sf \
            "$WAYBAR_CONFIGS/$config.jsonc" \
            "$WAYBAR_CONFIG_LINK"

    elif [[ -f "$WAYBAR_CONFIGS/$config.json" ]]; then
        ln -sf \
            "$WAYBAR_CONFIGS/$config.json" \
            "$WAYBAR_CONFIG_LINK"
    fi
}

# -----------------------------
# restart waybar
# -----------------------------
restart_waybar() {
    if [[ -x "$SCRIPTSDIR/wbrestart.sh" ]]; then
        "$SCRIPTSDIR/wbrestart.sh" &
    else
        pkill waybar
        waybar &
    fi
}

# -----------------------------
# close existing rofi
# -----------------------------
if pgrep -x rofi >/dev/null; then
    pkill rofi
fi

# -----------------------------
# choose style
# -----------------------------
STYLE_CHOICE=$(style_menu | rofi \
    -dmenu \
    -i \
    -config "$ROFI_CONFIG" \
    -mesg "$STYLE_MSG")

[[ -z "$STYLE_CHOICE" ]] && exit 0

apply_style "$STYLE_CHOICE"

# -----------------------------
# choose config
# -----------------------------
CONFIG_CHOICE=$(config_menu | rofi \
    -dmenu \
    -i \
    -config "$ROFI_CONFIG" \
    -mesg "$CONFIG_MSG")

[[ -z "$CONFIG_CHOICE" ]] && exit 0

apply_config "$CONFIG_CHOICE"

# -----------------------------
# restart
# -----------------------------
restart_waybar
