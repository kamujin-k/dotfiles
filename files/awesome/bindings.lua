--[[

     Awesome WM configuration template
     github.com/lcpz

--]]

-- {{{ Required libraries
local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type

local gears         = require("gears")
local awful         = require("awful")
                      require("awful.autofocus")
local beautiful     = require("beautiful")
local naughty       = require("naughty")
local lain          = require("lain")
local hotkeys_popup = require("awful.hotkeys_popup").widget
                      require("awful.hotkeys_popup.keys")
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility
local switcher      = require("awesome-switcher")
local xrandr        = require("xrandr")
local treetile      = require("treetile")
local treebindings  = require("treetile.bindings")



local terminal     = "kitty"
local cycle_prev   = true -- cycle trough all previous client or just the first -- https://github.com/lcpz/awesome-copycats/issues/274
local editor       = os.getenv("EDITOR") or "vim"
local gui_editor   = os.getenv("GUI_EDITOR") or "geany"
local browser      = os.getenv("BROWSER") or "brave-browser"
local scrlocker    = "xscreensaver-command -lock"
local k            = require("keys").init()
local actions      = require("actions")

local bindings = {}


function bindings.init(args)

-- {{{ Key bindings
local globalkeys = my_table.join(



    awful.key({ k.super,},k.tab,   awful.tag.viewnext,
              {description = "view previous tag", group = "tag"}),
    awful.key({ k.super,k.shift},k.tab,  awful.tag.viewprev,
              {description = "view next tag", group = "tag"}),

--    awful.key({ k.super }, "v", treetile.vertical),
--    awful.key({ k.super }, "h", treetile.horizontal),

    awful.key({k.super, k.ctrl}, "m", actions.switch_monitor_display_mode,
        {description = "switch monitor display mode", group = "hotkeys"}),

    awful.key({ k.alt }, "p", actions.take_a_screenshot,
        {description = "take a screenshot", group = "hotkeys"}),

    awful.key({ k.alt, k.ctrl }, "l", actions.lock_screen,
        {description = "lock screen", group = "hotkeys"}),

    -- Hotkeys
    awful.key({ k.super,}, "s", hotkeys_popup.show_help,
        {description = "show help", group="awesome"}),

    awful.key({ k.super,}, "w",
        function () awful.util.mymainmenu:show() end,
        {description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ k.super, k.shift   }, k.vim_down, 
        function () awful.client.swap.byidx(  1)    end,
        {description = "swap with next client by index", group = "client"}),
        
    awful.key({ k.super, k.shift   }, k.vim_up,
        function () awful.client.swap.byidx( -1)    end,
        {description = "swap with previous client by index", group = "client"}),

    awful.key({ k.super, k.ctrl }, k.vim_down,
        function () awful.screen.focus_relative( 1) end,
        {description = "focus the next screen", group = "screen"}),

    awful.key({ k.super, k.ctrl }, k.vim_up,
        function () awful.screen.focus_relative(-1) end,
        {description = "focus the previous screen", group = "screen"}),

    awful.key({ k.super,           }, "u", awful.client.urgent.jumpto,
    {description = "jump to urgent client", group = "client"}),

    awful.key({ k.super,           }, k.tab,
        function ()
            if cycle_prev then
                awful.client.focus.history.previous()
            else
                awful.client.focus.byidx(-1)
            end
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "cycle with previous/go back", group = "client"}),
    
    awful.key({ k.super, k.shift   }, k.tab,
        function ()
            if cycle_prev then
                awful.client.focus.byidx(1)
                if client.focus then
                    client.focus:raise()
                end
            end
        end,
        {description = "go forth", group = "client"}),

    -- Show/Hide Wibox
    awful.key({ k.super }, "b",
        function ()
            for s in screen do
                s.mywibox.visible = not s.mywibox.visible
                if s.mybottomwibox then
                    s.mybottomwibox.visible = not s.mybottomwibox.visible
                end
            end
        end,
        {description = "toggle wibox", group = "awesome"}),


    awful.key({ k.alt, k.ctrl }, "+",
        function () lain.util.useless_gaps_resize(1) end,
        {description = "increment useless gaps", group = "tag"}),

    awful.key({ k.alt, k.ctrl }, "-",
        function () lain.util.useless_gaps_resize(-1) end,
        {description = "decrement useless gaps", group = "tag"}),

    -- Dynamic tagging
    awful.key({ k.super, k.shift }, "n",
        function () lain.util.add_tag() end,
        {description = "add new tag", group = "tag"}),

    awful.key({ k.super, k.shift }, "r",
        function () lain.util.rename_tag() end,
        {description = "rename tag", group = "tag"}),

    awful.key({ k.super, k.shift }, k.arrow_left,
        function () lain.util.move_tag(-1) end,
        {description = "move tag to the left", group = "tag"}),

    awful.key({ k.super, k.shift }, k.arrow_right,
        function () lain.util.move_tag(1) end,
        
        {description = "move tag to the right", group = "tag"}),
    awful.key({ k.super, k.shift }, "d",
        function () lain.util.delete_tag() end,
        {description = "delete tag", group = "tag"}),

    -- Standard program
    awful.key({ k.super,           }, k.enter,
    --directory
    
                function ()
                    local c = awful.client.getmaster()
                    if c and c.class == "kitty" then
                        local file = io.open("/tmp/current_dir","r")
                        if file then
                            io.input(file)
                            local currentDir = io.read()
                            io.close(file)
                            awful.spawn(terminal .. " -d=" .. currentDir)
                        else
                            awful.spawn(terminal)
                        end
                    else
                        awful.spawn(terminal)
                    end
                end,
              {description = "open a terminal", group = "launcher"}),

    awful.key({ k.super, k.ctrl }, "r", awesome.restart,
        {description = "reload awesome", group = "awesome"}),

    awful.key({ k.super, k.shift   }, "q", awesome.quit,
        {description = "quit awesome", group = "awesome"}),

    awful.key({ k.alt, k.shift   }, k.vim_right,     function () awful.tag.incmwfact( 0.02)          end,
        {description = "increase master width factor", group = "layout"}),

    awful.key({ k.alt, k.shift   }, k.vim_left,     function () awful.tag.incmwfact(-0.02)          end,
        {description = "decrease master width factor", group = "layout"}),

    awful.key({ k.super, k.shift   }, k.vim_left,     function () awful.tag.incnmaster( 1, nil, true) end,
        {description = "increase the number of master clients", group = "layout"}),

    awful.key({ k.super, k.shift   }, k.vim_right,     function () awful.tag.incnmaster(-1, nil, true) end,
        {description = "decrease the number of master clients", group = "layout"}),

    awful.key({ k.super, k.ctrl }, k.vim_left,     function () awful.tag.incncol( 1, nil, true)    end,
        {description = "increase the number of columns", group = "layout"}),

    awful.key({ k.super, k.ctrl }, k.vim_right,     function () awful.tag.incncol(-1, nil, true)    end,
        {description = "decrease the number of columns", group = "layout"}),


    awful.key({ k.super, k.ctrl }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                      client.focus = c
                      c:raise()
                  end
              end,
              {description = "restore minimized", group = "client"}),


    -- Brightness
    awful.key({ }, "XF86MonBrightnessUp",
        function () os.execute("xbacklight -inc 10") end,
              {description = "+10%", group = "hotkeys"}),
    awful.key({ }, "XF86MonBrightnessDown",
        function () os.execute("xbacklight -dec 10") end,
              {description = "-10%", group = "hotkeys"}),

    -- ALSA volume control
    awful.key({ }, "XF86AudioRaiseVolume",
        function ()
            os.execute(string.format("amixer -q set %s 1%%+", beautiful.volume.channel))
            beautiful.volume.update()
        end,
        {description = "volume up", group = "hotkeys"}),
    awful.key({ }, "XF86AudioLowerVolume",
        function ()
            os.execute(string.format("amixer -q set %s 1%%-", beautiful.volume.channel))
            beautiful.volume.update()
        end,
        {description = "volume down", group = "hotkeys"}),
    awful.key({ }, "XF86AudioMute",
        function ()
            os.execute(string.format("amixer -q set %s toggle",  beautiful.volume.togglechannel or beautiful.volume.channel))
            beautiful.volume.update()
        end,
        {description = "toggle mute", group = "hotkeys"}),
    awful.key({ k.ctrl }, "XF86AudioRaiseVolume",
        function ()
            os.execute(string.format("amixer -q set %s 100%%", beautiful.volume.channel))
            beautiful.volume.update()
        end,
        {description = "volume 100%", group = "hotkeys"}),
    awful.key({ k.ctrl }, "XF86AudioLowerVolume",
        function ()
            os.execute(string.format("amixer -q set %s 0%%", beautiful.volume.channel))
            beautiful.volume.update()
        end,
        {description = "volume 0%", group = "hotkeys"}),

    -- MPD control
    awful.key({ }, "XF86AudioPlay",
        function ()
            os.execute("mpc toggle")
            beautiful.mpd.update()
        end,
        {description = "mpc toggle", group = "widgets"}),

    awful.key({ }, "XF86AudioStop",
        function ()
            os.execute("mpc stop")
            beautiful.mpd.update()
        end,
        {description = "mpc stop", group = "widgets"}),

    awful.key({ }, "XF86AudioPrev",
        function ()
            os.execute("mpc prev")
            beautiful.mpd.update()
        end,
        {description = "mpc prev", group = "widgets"}),

    awful.key({ }, "XF86AudioNext",
        function ()
            os.execute("mpc next")
            beautiful.mpd.update()
        end,
        {description = "mpc next", group = "widgets"}),

    awful.key({ k.alt }, "0",
        function ()
            local common = { text = "MPD widget ", position = "top_middle", timeout = 2 }
            if beautiful.mpd.timer.started then
                beautiful.mpd.timer:stop()
                common.text = common.text .. lain.util.markup.bold("OFF")
            else
                beautiful.mpd.timer:start()
                common.text = common.text .. lain.util.markup.bold("ON")
            end
            naughty.notify(common)
        end,
        {description = "mpc on/off", group = "widgets"}),

        
    -- Copy primary to clipboard (terminals to gtk)
    awful.key({ k.super }, "c",
        function () awful.spawn.with_shell("xsel | xsel -i -b") end,
              {description = "copy terminal to gtk", group = "hotkeys"}),

              
    -- Copy clipboard to primary (gtk to terminals)
    awful.key({ k.super }, "v",
        function () awful.spawn.with_shell("xsel -b | xsel") end,
              {description = "copy gtk to terminal", group = "hotkeys"}),


    -- User programs
    awful.key({ k.super }, "q",
        function () awful.spawn(browser) end,
              {description = "run browser", group = "launcher"}),

              
    awful.key({ k.super }, "a",
        function () awful.spawn(gui_editor) end,
              {description = "run gui editor", group = "launcher"}),

    -- Default
    --[[ Menubar
    awful.key({ k.super }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"})
    --]]

    -- Alt + Tab Switcher
    awful.key({ k.alt,           }, k.tab,
      function ()
          switcher.switch( 1, k.alt, "Alt_L", k.shift, k.tab)
      end),
    
    awful.key({ k.alt, k.shift   }, k.tab,
      function ()
          switcher.switch(-1, k.alt, "Alt_L", k.shift, k.tab)
      end),


    awful.key({ k.super, k.shift }, k.enter,
        function ()
            os.execute(string.format("rofi -show combi drun run"))
        end,
        {description = "show rofi", group = "launcher"}),
    


    -- Prompt
    awful.key({ k.super }, "r",
        function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher"}),

    awful.key({ k.super }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"})
    --]]
    )

    local clientkeys = my_table.join(




        -- Default client focus
        awful.key({ k.alt,}, k.vim_down, actions.focus_next_by_index,
            {description = "focus next by index", group = "client"}),


        awful.key({ k.alt,}, k.vim_up, actions.focus_previous_by_index
            {description = "focus previous by index", group = "client"}),

        -- By (vim) direction client focus
        awful.key({ k.super }, k.vim_down, actions.focus_down,
            {description = "focus down", group = "client"}),
        
        awful.key({ k.super }, k.vim_up, actions.focus_up,
            {description = "focus up", group = "client"}),
        
        awful.key({ k.super }, k.vim_left, actions.focus_left,
            {description = "focus left", group = "client"}),

        awful.key({ k.super }, k.vim_right, actions.focus_right,
            {description = "focus right", group = "client"}),

        -- By (arrow) direction client focus
        awful.key({ k.super }, k.arrow_down, actions.focus_down,
            {description = "focus down", group = "client"}),
        
        awful.key({ k.super }, k.arrow_up, actions.focus_up,
            {description = "focus up", group = "client"}),
        
        awful.key({ k.super }, k.arrow_left, actions.focus_left,
            {description = "focus left", group = "client"}),

        awful.key({ k.super }, k.arrow_right, actions.focus_right,
            {description = "focus right", group = "client"}),




        awful.key({ k.alt, k.shift   }, "m", actions.magnify_client,
                {description = "magnify client", group = "client"}),

        awful.key({ k.super,           }, "f",
            function (c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end,
            {description = "toggle fullscreen", group = "client"}),

        awful.key({ k.alt   }, "F4",      function (c) c:kill() end,
                {description = "close", group = "client"}),

        awful.key({ k.super   }, "F4",      function (c) c:kill() end,
                {description = "close", group = "client"}),

        awful.key({ k.super, k.ctrl }, k.space,  awful.client.floating.toggle                     ,
                {description = "toggle floating", group = "client"}),

        awful.key({ k.super, k.ctrl }, k.enter,
        function (c) c:swap(awful.client.getmaster()) end,
                {description = "move to master", group = "client"}),

        awful.key({ k.super,           }, "o",      function (c) c:move_to_screen()               end,
                {description = "move to screen", group = "client"}),

        awful.key({ k.super, k.shift}, "t",      function (c) c.ontop = not c.ontop            end,
                {description = "toggle keep on top", group = "client"}),

        awful.key({ k.super,           }, "n",
            function (c)
                -- The client currently has the input focus, so it cannot be
                -- minimized, since minimized clients can't have the focus.
                c.minimized = true
            end ,
            {description = "minimize", group = "client"}),

        awful.key({ k.super,           }, "m",
            function (c)
                c.maximized = not c.maximized
                c:raise()
            end ,
            {description = "maximize", group = "client"}),
            
        awful.key({ k.super }, "t", awful.titlebar.toggle,
        {description = "toggle titlebar", group = "client"})

    )

    -- Bind all key numbers to tags.
    -- Be careful: we use keycodes to make it works on any keyboard layout.
    -- This should map on the top row of your keyboard, usually 1 to 9.
    for i = 1, 9 do
        -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
        local descr_view, descr_toggle, descr_move, descr_toggle_focus
        if i == 1 or i == 9 then
            descr_view = {description = "view tag #", group = "tag"}
            descr_toggle = {description = "toggle tag #", group = "tag"}
            descr_move = {description = "move focused client to tag #", group = "tag"}
            descr_toggle_focus = {description = "toggle focused client on tag #", group = "tag"}
        end

        globalkeys = my_table.join(globalkeys,
            -- View tag only.
            awful.key({ k.super }, "#" .. i + 9,
                    function ()
                            local screen = awful.screen.focused()
                            local tag = screen.tags[i]
                            if tag then
                            tag:view_only()
                            end
                    end,
                    descr_view),

            -- Toggle tag display.
            awful.key({ k.super, k.ctrl }, "#" .. i + 9,
                    function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                            awful.tag.viewtoggle(tag)
                        end
                    end,
                    descr_toggle),

            -- Move client to tag.
            awful.key({ k.super, k.shift }, "#" .. i + 9,
                    function ()
                        if client.focus then
                            local tag = client.focus.screen.tags[i]
                            if tag then
                                client.focus:move_to_tag(tag)
                            end
                        end
                    end,
                    descr_move),
                    
            -- Toggle tag on focused client.
            awful.key({ k.super, k.ctrl, k.shift }, "#" .. i + 9,
                    function ()
                        if client.focus then
                            local tag = client.focus.screen.tags[i]
                            if tag then
                                client.focus:toggle_tag(tag)
                            end
                        end
                    end,
                    descr_toggle_focus)
        )
    end

    return globalkeys, clientkeys
end

return bindings
