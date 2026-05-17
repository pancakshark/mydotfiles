---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

-- Main apps
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))

-- Window controls
local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())

hl.bind(mainMod .. " + V",
        hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + P",
        hl.dsp.window.pseudo())

hl.bind(mainMod .. " + J",
        hl.dsp.layout("togglesplit"))

-- Exit menu
hl.bind(mainMod .. " + M",
        hl.dsp.exec_cmd(
            "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"
        ))

-- Waybar restart
hl.bind(mainMod .. " + SHIFT + R",
        hl.dsp.exec_cmd("~/.config/hypr/scripts/wbrestart.sh"))

-- Lock screen
hl.bind(mainMod .. " + L",
        hl.dsp.exec_cmd("~/.config/hypr/scripts/hyprlock.sh"))

-- Screenshot
hl.bind(mainMod .. " + CTRL + S",
        hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh"))

-- Wallpaper picker
hl.bind(mainMod .. " + W",
        hl.dsp.exec_cmd("~/.config/hypr/scripts/wppicker.sh"))

-- Kill active process
hl.bind(mainMod .. " + SHIFT + X",
        hl.dsp.exec_cmd("~/.config/hypr/scripts/KillActiveProcess.sh"))

-- Color picker
hl.bind(mainMod .. " + SHIFT + C",
        hl.dsp.exec_cmd("hyprpicker -a"))

-- Waybar styles
hl.bind(mainMod .. " + CTRL + B",
        hl.dsp.exec_cmd("~/.config/hypr/scripts/WaybarStyles.sh"))

-- Waybar layouts
hl.bind(mainMod .. " + ALT + B",
        hl.dsp.exec_cmd("~/.config/hypr/scripts/WaybarLayout.sh"))

-- Hide/show Waybar
hl.bind(mainMod .. " + H",
        hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))

-- Move focus
hl.bind(mainMod .. " + left",
        hl.dsp.focus({ direction = "left" }))

hl.bind(mainMod .. " + right",
        hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + up",
        hl.dsp.focus({ direction = "up" }))

hl.bind(mainMod .. " + down",
        hl.dsp.focus({ direction = "down" }))

-- Workspaces
for i = 1, 10 do
    local key = i % 10

    hl.bind(mainMod .. " + " .. key,
            hl.dsp.workspace(i))

    hl.bind(mainMod .. " + SHIFT + " .. key,
            hl.dsp.movetoworkspace(i))
    end

    -- Special workspace
    hl.bind(mainMod .. " + S",
            hl.dsp.workspace.toggle_special("magic"))

    hl.bind(mainMod .. " + SHIFT + S",
            hl.dsp.window.move({ workspace = "special:magic" }))

    -- Scroll workspaces
    hl.bind(mainMod .. " + mouse_down",
            hl.dsp.workspace("e+1"))

    hl.bind(mainMod .. " + mouse_up",
            hl.dsp.workspace("e-1"))

    -- Mouse drag/resize
    hl.bind(mainMod .. " + mouse:272",
            hl.dsp.window.drag(),
            { mouse = true })

    hl.bind(mainMod .. " + mouse:273",
            hl.dsp.window.resize(),
            { mouse = true })

    -- Volume controls
    hl.bind("XF86AudioRaiseVolume",
            hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh --inc"),
            { locked = true, repeating = true })

    hl.bind("XF86AudioLowerVolume",
            hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh --dec"),
            { locked = true, repeating = true })

    hl.bind("XF86AudioMute",
            hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh --toggle"),
            { locked = true })

    hl.bind("XF86AudioMicMute",
            hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
            { locked = true })

    -- Brightness controls
    hl.bind("XF86MonBrightnessUp",
            hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness.sh --inc"),
            { locked = true, repeating = true })

    hl.bind("XF86MonBrightnessDown",
            hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness.sh --dec"),
            { locked = true, repeating = true })

    -- Media controls
    hl.bind("XF86AudioNext",
            hl.dsp.exec_cmd("playerctl next"),
            { locked = true })

    hl.bind("XF86AudioPause",
            hl.dsp.exec_cmd("playerctl play-pause"),
            { locked = true })

    hl.bind("XF86AudioPlay",
            hl.dsp.exec_cmd("playerctl play-pause"),
            { locked = true })

    hl.bind("XF86AudioPrev",
            hl.dsp.exec_cmd("playerctl previous"),
            { locked = true })

--[[
---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

-- Main apps
hl.bind(mainMod .. " + Q",
hl.dsp.exec_cmd(terminal))

hl.bind(mainMod .. " + E",
hl.dsp.exec_cmd(fileManager))

hl.bind(mainMod .. " + D",
hl.dsp.exec_cmd(menu))

-- Window controls
hl.bind(mainMod .. " + C",
hl.dsp.window.close())

hl.bind(mainMod .. " + V",
hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + P",
hl.dsp.window.pseudo())

hl.bind(mainMod .. " + J",
hl.dsp.layout("togglesplit"))

-- Exit menu
hl.bind(mainMod .. " + M",
hl.dsp.exec_cmd(
        "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"
        ))

        -- Restart Waybar
        hl.bind(mainMod .. " + SHIFT + R",
        hl.dsp.exec_cmd("~/.config/hypr/scripts/wbrestart.sh"))

        -- Lock screen
        hl.bind(mainMod .. " + L",
        hl.dsp.exec_cmd("~/.config/hypr/scripts/hyprlock.sh"))

        -- Screenshot
        hl.bind(mainMod .. " + CTRL + S",
        hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh"))

        -- Wallpaper picker
        hl.bind(mainMod .. " + W",
        hl.dsp.exec_cmd("~/.config/hypr/scripts/wppicker.sh"))

        -- Kill active process
        hl.bind(mainMod .. " + SHIFT + X",
        hl.dsp.exec_cmd("~/.config/hypr/scripts/KillActiveProcess.sh"))

        -- Color picker
        hl.bind(mainMod .. " + SHIFT + C",
        hl.dsp.exec_cmd("hyprpicker -a"))

        -- Waybar styles
        hl.bind(mainMod .. " + CTRL + B",
        hl.dsp.exec_cmd("~/.config/hypr/scripts/WaybarStyles.sh"))

        -- Waybar layouts
        hl.bind(mainMod .. " + ALT + B",
        hl.dsp.exec_cmd("~/.config/hypr/scripts/WaybarLayout.sh"))

        -- Hide/show Waybar
        hl.bind(mainMod .. " + H",
        hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))

        -- Move focus
        hl.bind(mainMod .. " + left",
        hl.dsp.focus({ direction = "left" }))

        hl.bind(mainMod .. " + right",
        hl.dsp.focus({ direction = "right" }))

        hl.bind(mainMod .. " + up",
        hl.dsp.focus({ direction = "up" }))

        hl.bind(mainMod .. " + down",
        hl.dsp.focus({ direction = "down" }))

        -- Move windows
        hl.bind(mainMod .. " + CTRL + left",
        hl.dsp.exec_cmd("hyprctl dispatch movewindow l"))

        hl.bind(mainMod .. " + CTRL + right",
        hl.dsp.exec_cmd("hyprctl dispatch movewindow r"))

        hl.bind(mainMod .. " + CTRL + up",
        hl.dsp.exec_cmd("hyprctl dispatch movewindow u"))

        hl.bind(mainMod .. " + CTRL + down",
        hl.dsp.exec_cmd("hyprctl dispatch movewindow d"))

        -- Resize windows
        hl.bind(mainMod .. " + SHIFT + left",
        hl.dsp.exec_cmd("hyprctl dispatch resizeactive -50 0"),
        { repeating = true })

        hl.bind(mainMod .. " + SHIFT + right",
        hl.dsp.exec_cmd("hyprctl dispatch resizeactive 50 0"),
        { repeating = true })

        hl.bind(mainMod .. " + SHIFT + up",
        hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 -50"),
        { repeating = true })

        hl.bind(mainMod .. " + SHIFT + down",
        hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 50"),
        { repeating = true })

        -- Workspaces
        for i = 1, 10 do
                local key = i % 10

                hl.bind(mainMod .. " + " .. key,
                hl.dsp.exec_cmd("hyprctl dispatch workspace " .. i))

                hl.bind(mainMod .. " + SHIFT + " .. key,
                hl.dsp.exec_cmd("hyprctl dispatch movetoworkspace " .. i))
                end

                -- Special workspace
                hl.bind(mainMod .. " + S",
                hl.dsp.exec_cmd("hyprctl dispatch togglespecialworkspace magic"))

                hl.bind(mainMod .. " + SHIFT + S",
                hl.dsp.exec_cmd("hyprctl dispatch movetoworkspace special:magic"))

                -- Scroll workspaces
                hl.bind(mainMod .. " + mouse_down",
                hl.dsp.exec_cmd("hyprctl dispatch workspace e+1"))

                hl.bind(mainMod .. " + mouse_up",
                hl.dsp.exec_cmd("hyprctl dispatch workspace e-1"))

                -- Mouse drag/resize
                hl.bind(mainMod .. " + mouse:272",
                hl.dsp.window.drag(),
                { mouse = true })

                hl.bind(mainMod .. " + mouse:273",
                hl.dsp.window.resize(),
                { mouse = true })

                -- Volume controls
                hl.bind("XF86AudioRaiseVolume",
                hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh --inc"),
                { locked = true, repeating = true })

                hl.bind("XF86AudioLowerVolume",
                hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh --dec"),
                { locked = true, repeating = true })

                hl.bind("XF86AudioMute",
                hl.dsp.exec_cmd("~/.config/hypr/scripts/volume.sh --toggle"),
                { locked = true })

                hl.bind("XF86AudioMicMute",
                hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
                { locked = true })

                -- Brightness controls
                hl.bind("XF86MonBrightnessUp",
                hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness.sh --inc"),
                { locked = true, repeating = true })

                hl.bind("XF86MonBrightnessDown",
                hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness.sh --dec"),
                { locked = true, repeating = true })

                -- Media controls
                hl.bind("XF86AudioNext",
                hl.dsp.exec_cmd("playerctl next"),
                { locked = true })

                hl.bind("XF86AudioPause",
                hl.dsp.exec_cmd("playerctl play-pause"),
                { locked = true })

                hl.bind("XF86AudioPlay",
                hl.dsp.exec_cmd("playerctl play-pause"),
                { locked = true })

                hl.bind("XF86AudioPrev",
                hl.dsp.exec_cmd("playerctl previous"),
                { locked = true })]]
