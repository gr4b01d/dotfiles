--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({ match = { class = "swayimg" }, float = true })
hl.window_rule({ match = { class = "clipse" }, float = true })
hl.window_rule({ match = { class = "ncmpcpp" }, float = true })
hl.window_rule({ match = { class = "footup" }, float = true })
hl.window_rule({ match = { class = "yownloader" }, float = true })
hl.window_rule({ match = { class = "update" }, float = true })
hl.window_rule({ match = { class = "calc" }, float = true })
hl.window_rule({ match = { class = "org.gnome.Calculator" }, float = true })

hl.window_rule({
        name = "feh",
        match = { class = "feh"},

        float = true,
	move  = {"cursor_x-(window_w*0.5)", "cursor_y-(window_h*0.5)"},
})

hl.window_rule({
        name = "spotifyfloat",
        match = { class = "Spotify" },

        float = true,
})

hl.window_rule({
        name = "term",
        match = { class = "com.term.term"},

        float = true,
        --opacity = "0.8",
        center = off,
})

hl.window_rule({
        name = "ncmpcpp",
        match = { class = "ncmpcpp"},

        float = true,
        opacity = "0.8",
        center = off,
})

hl.window_rule({
        name = "cava",
        match = { class = "cava"},

        float = true,
        opacity = "0.6",
        center = off,
})

hl.window_rule({
        name = "clock",
        match = { class = "clock"},

        float = true,
        center = off,
})


