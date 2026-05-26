local terminal    = "ghostty"
local fileManager = "ghostty --command=yazi"
local menu        = "fuzzel"
local browser     = "firefox"
local social      = "discord"

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

--hl.bind("", hl.dsp.exec_cmd()) <--for yanking

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind("SUPER + Return", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind("Xf86Search", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + B", hl.dsp.exec_cmd("fuzzel -d -l 0 --placeholder 'Type your search' | sed 's/^/\"/g;s/$/\"/g' | xargs firefox --search"))
hl.bind("SUPER + S", hl.dsp.exec_cmd("/home/tagilla/.Scripts/PyprMenu.zsh"))
hl.bind("Xf86Mail", hl.dsp.exec_cmd("thunderbird"))
hl.bind("SUPER + CTRL + D", hl.dsp.exec_cmd(social))
hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + M", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind("Xf86Calculator", hl.dsp.exec_cmd("pypr toggle calc"))
hl.bind("SHIFT + KP_End", hl.dsp.exec_cmd("obs-cli -P 4444 -p ATHELSTAN record toggle"))
hl.bind("CTRL + Insert", hl.dsp.exec_cmd("playerctl -p spotify previous"))
hl.bind("CTRL + Home", hl.dsp.exec_cmd("playerctl -p spotify play-pause"))
hl.bind("CTRL + Prior", hl.dsp.exec_cmd("playerctl -p spotify next"))
hl.bind("SUPER + W", hl.dsp.exec_cmd("pypr hide '*'"))
hl.bind("SUPER + CTRL + C", hl.dsp.exec_cmd("/home/tagilla/.Scripts/Yownloader.zsh"))
hl.bind("SUPER + CTRL + SHIFT + C", hl.dsp.exec_cmd(". > ~/batch.txt"))
hl.bind("SUPER + CTRL + U", hl.dsp.exec_cmd("~/.Scripts/update.zsh"))
hl.bind("SUPER + CTRL + V", hl.dsp.exec_cmd("/home/tagilla/.Scripts/VPNMenu.zsh"))
hl.bind("Print", hl.dsp.exec_cmd("hyprshot --output-folder /home/tagilla/Pictures/Hyprshot -m output -m active"))
hl.bind("SUPER + Print", hl.dsp.exec_cmd("/home/tagilla/.Scripts/screenshot.zsh"))
hl.bind("SUPER + N", hl.dsp.exec_cmd("swaync-client -t"))
hl.bind("CTRL + Print", hl.dsp.exec_cmd("rmpc prev"))
hl.bind("CTRL + Scroll_Lock", hl.dsp.exec_cmd("rmpc togglepause"))
hl.bind("CTRL + Pause", hl.dsp.exec_cmd("rmpc next"))
hl.bind("SUPER + J", hl.dsp.layout("togglesplit")) 
hl.bind("SUPER + H", hl.dsp.layout("swapsplit"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("/home/tagilla/.Scripts/SyncMenu.zsh"))
hl.bind("CTRL + 9", hl.dsp.exec_cmd("ghostty --class=com.a.AudioSwitcher  --command=~/custom-scripts/Shell-Widgets/change-audio.sh"))
hl.bind("CTRL + SHIFT + W", hl.dsp.exec_cmd("python3 /home/tagilla/custom-scripts/Python-Widgets/changewall-widget.py"))
-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end


-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle "),     { locked = true, repeating = true })
--hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })



hl.bind("SUPER + CTRL + W", hl.dsp.exec_cmd("freetube --new-window 'https://www.youtube.com/watch?v=uuxbXceM7_U'"))





















hl.bind("CTRL + SHIFT + Print", hl.dsp.exec_cmd("paplay /home/tagilla/AudioStuff/funi.opus"))

