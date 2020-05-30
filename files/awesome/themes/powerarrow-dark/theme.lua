--[[

     Powerarrow Dark Awesome WM theme
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
awesome_dir                                       = os.getenv("HOME") .. "/.config/awesome"
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow-dark"
theme.wallpaper                                 = theme.dir .. "/wall2.jpg"
theme.font                                      = "Terminus 11"
theme.fg_normal                                 = "#DDDDFF"
theme.fg_focus                                  = "#EA6F81"
theme.fg_urgent                                 = "#CC9393"
theme.bg_normal                                 = "#1A1A1A"
-- theme.bg_focus                                  = "#313131"
theme.bg_focus                                  = "#595959"
theme.bg_urgent                                 = "#1A1A1A"
theme.border_width                              = 3
theme.border_normal                             = "#3F3F3F"
-- theme.border_focus                              = "#19CB00"
theme.border_focus                              = "#0400FF"
theme.border_marked                             = "#CC9393"
theme.tasklist_bg_focus                         = "#1A1A1A"
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_focus
theme.menu_height                               = dpi(16)
theme.menu_width                                = dpi(140)
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"

theme.layout_tile                               = theme.dir .. "/layouticons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/layouticons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/layouticons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/layouticons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/layouticons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/layouticons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/layouticons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/layouticons/dwindle.png"
theme.layout_max                                = theme.dir .. "/layouticons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/layouticons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/layouticons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/layouticons/floating.png"

theme.layout_cascade                            = theme.dir .. "/layouticons/cascade.png"
theme.layout_cascadetile                        = theme.dir .. "/layouticons/tile.png"
theme.layout_centerwork                         = theme.dir .. "/layouticons/centerwork.png"
theme.layout_centerworkh                        = theme.dir .. "/layouticons/centerhwork.png"
theme.layout_termfair                           = theme.dir .. "/layouticons/termfair.png"
theme.layout_centerfair                         = theme.dir .. "/layouticons/centerfair.png"

theme.layout_cornernw                           = theme.dir .. "/layouticons/cornernw.png"
theme.layout_cornerne                           = theme.dir .. "/layouticons/cornerne.png"
theme.layout_cornersw                           = theme.dir .. "/layouticons/cornersw.png"
theme.layout_cornerse                           = theme.dir .. "/layouticons/cornerse.png"
theme.layout_treetile                           = awesome_dir ..  "/treetile/layout_icon.png"


theme.widget_ac                                 = theme.dir .. "/icons/ac.png"
theme.widget_battery                            = theme.dir .. "/icons/battery.png"
theme.widget_battery_low                        = theme.dir .. "/icons/battery_low.png"
theme.widget_battery_empty                      = theme.dir .. "/icons/battery_empty.png"
theme.widget_mem                                = theme.dir .. "/icons/mem.png"
theme.widget_cpu                                = theme.dir .. "/icons/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons/temp.png"
theme.widget_net                                = theme.dir .. "/icons/net.png"
theme.widget_hdd                                = theme.dir .. "/icons/hdd.png"
theme.widget_music                              = theme.dir .. "/icons/note.png"
theme.widget_music_on                           = theme.dir .. "/icons/note_on.png" 
theme.widget_vol                                = theme.dir .. "/icons/vol.png"
theme.widget_vol_low                            = theme.dir .. "/icons/vol_low.png"
theme.widget_vol_no                             = theme.dir .. "/icons/vol_no.png"
theme.widget_vol_mute                           = theme.dir .. "/icons/vol_mute.png"
theme.widget_mail                               = theme.dir .. "/icons/mail.png"
theme.widget_mail_on                            = theme.dir .. "/icons/mail_on.png"
theme.tasklist_disable_task_name                =  true
theme.useless_gap                               = 4
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"
theme.systray_icon_spacing                      = 10

local markup = lain.util.markup
local separators = lain.util.separators

-- Textclock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local clock = awful.widget.watch(
    "date +'%a %d %b %R:%S'", 1,
    function(widget, stdout)
        widget:set_markup(" " .. markup.font(theme.font, stdout))
    end
)


-- Weather
theme.weather = lain.widget.weather({
    city_id = 3451190, -- Rio de Janeiro
    settings = function()
        units = math.floor(weather_now["main"]["temp"])
        widget:set_markup(" " .. units .. " ")
    end
})

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { clock },
    notification_preset = {
        font = "Monospace 10",
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})

-- MPD
local musicplr = awful.util.terminal .. " -title Music -g 130x34-320+16 -e ncmpcpp"
local mpdicon = wibox.widget.imagebox(theme.widget_music)
mpdicon:buttons(my_table.join(
    awful.button({ modkey }, 1, function () awful.spawn.with_shell(musicplr) end),
    awful.button({ }, 1, function ()
        os.execute("mpc prev")
        theme.mpd.update()
    end),
    awful.button({ }, 2, function ()
        os.execute("mpc toggle")
        theme.mpd.update()
    end),
    awful.button({ }, 3, function ()
        os.execute("mpc next")
        theme.mpd.update()
    end)))
theme.mpd = lain.widget.mpd({
    settings = function()
        if mpd_now.state == "play" then
            artist = " " .. mpd_now.artist .. " "
            title  = mpd_now.title  .. " "
            mpdicon:set_image(theme.widget_music_on)
        elseif mpd_now.state == "pause" then
            artist = " mpd "
            title  = "paused "
        else
            artist = ""
            title  = ""
            mpdicon:set_image(theme.widget_music)
        end

        widget:set_markup(markup.font(theme.font, markup("#EA6F81", artist) .. title))
    end
})

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. mem_now.used .. "MB "))
    end
})

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. string.format("%03d", cpu_now.usage) .. "% "))
    end
})

-- Coretemp
local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. coretemp_now .. "°C "))
    end
})

-- / fs
--[[ commented because it needs Gio/Glib >= 2.54
local fsicon = wibox.widget.imagebox(theme.widget_hdd)
theme.fs = lain.widget.fs({
    notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal, font = "Terminus 10" },
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. fs_now["/"].percentage .. "% "))
    end
})
--]]

-- Battery
local baticon = wibox.widget.imagebox(theme.widget_battery)
local bat = lain.widget.bat({
    settings = function()
        if bat_now.status and bat_now.status ~= "N/A" then
            if bat_now.ac_status == 1 then
                baticon:set_image(theme.widget_ac)
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 5 then
                baticon:set_image(theme.widget_battery_empty)
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then
                baticon:set_image(theme.widget_battery_low)
            else
                baticon:set_image(theme.widget_battery)
            end
            widget:set_markup(markup.font(theme.font, " " .. string.format("%03d", bat_now.perc) .. "% "))
        else
            widget:set_markup(markup.font(theme.font, " AC "))
            baticon:set_image(theme.widget_ac)
        end
    end
})

-- ALSA volume
local volicon = wibox.widget.imagebox(theme.widget_vol)
theme.volume = lain.widget.alsa({
    settings = function()
        if volume_now.status == "off" then
            volicon:set_image(theme.widget_vol_mute)
        elseif tonumber(volume_now.level) == 0 then
            volicon:set_image(theme.widget_vol_no)
        elseif tonumber(volume_now.level) <= 50 then
            volicon:set_image(theme.widget_vol_low)
        else
            volicon:set_image(theme.widget_vol)
        end

        widget:set_markup(markup.font(theme.font, " " .. string.format("%03d", volume_now.level) .. "%"))
    end
})
theme.volume.widget:buttons(awful.util.table.join(
                               awful.button({}, 4, function ()
                                     awful.util.spawn("amixer set Master 1%+")
                                     theme.volume.update()
                               end),
                               awful.button({}, 5, function ()
                                     awful.util.spawn("amixer set Master 1%-")
                                     theme.volume.update()
                               end)
))

-- Net
local neticon = wibox.widget.imagebox(theme.widget_net)
local net = lain.widget.net({
    settings = function()
        widget:set_markup(markup.font(theme.font,
                          markup("#7AC82E", " " .. string.format("%01.1f", net_now.received))
                          .. " " ..
                          markup("#46A8C3", " " .. string.format("%01.1f", net_now.sent) .. " ")))
    end
})

-- Separators
local spr       = wibox.widget.textbox(' ')
local separator = {arrl_ld, arrl_dl}
local arrl_dl   = separators.arrow_left(theme.bg_focus, "alpha")
local arrl_ld   = separators.arrow_left("alpha", theme.bg_focus)

local function light(w)
    return wibox.container.background(w, theme.bg_focus)
end

local function dark(w)
    return w
end


-- Get the list of files from a directory. Must be all images or folders and non-empty. 
function scanDir(directory)
    local i, fileList, popen = 0, {}, io.popen
    for filename in popen([[find "]] ..directory.. [[" -type f]]):lines() do
        i = i + 1
        fileList[i] = filename
    end
    return fileList
end

theme.wallpaper = function(s)

    wallpaperDir = os.getenv("HOME") .. "/Imagens/wallpapers"
    wallpaperList = scanDir(wallpaperDir)

    -- Apply a random wallpaper on startup.
    gears.wallpaper.maximized(wallpaperList[math.random(1, #wallpaperList)], s, true)

    -- Apply a random wallpaper every changeTime seconds.
    changeTime = 1800
    wallpaperTimer = timer { timeout = changeTime }
    wallpaperTimer:connect_signal("timeout", function()

    for s in screen do 
        gears.wallpaper.maximized(wallpaperList[math.random(1, #wallpaperList)], s, true)
    end

    -- stop the timer (we don't need multiple instances running at the same time)
        wallpaperTimer:stop()

    --restart the timer
        wallpaperTimer.timeout = changeTime
        wallpaperTimer:start()
    end)

    -- initial start when rc.lua is first run
    wallpaperTimer:start()
end




function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end


    -- Tags
    local l = awful.layout.suit  -- Just to save some typing: use an alias.
    local layouts = { l.tile.right }
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1 ) end),
                           awful.button({}, 2, function () awful.layout.inc( 1 ) end),
                           awful.button({}, 3, function () awful.layout.inc( 1 ) end),
                           awful.button({}, 4, function () awful.layout.inc( 1 ) end),
                           awful.button({}, 5, function () awful.layout.inc( 1 ) end),
                           awful.button({}, 5, function () awful.layout.inc( 1 ) end)))
    -- Create a taglist widget
    -- s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)




    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        style   = {
            -- shape = gears.shape.powerline
            bg_focus = theme.bg_focus,
            bg_urgent = theme.bg_urgent,
        },
        widget_template = {
            {
                {
                    {
                        {
                            {
                                id     = 'index_role',
                                widget = wibox.widget.textbox,
                            },
                            margins = 0,
                            widget  = wibox.container.margin,
                        },
                        bg     = theme.bg_urgent,
                        shape  = gears.shape.circle,
                        widget = wibox.container.background,
                    },

                    {
                        {
                            id     = 'icon_role',
                            widget = wibox.widget.imagebox,
                        },
                        margins = 2,
                        widget  = wibox.container.margin,
                    },

                    {
                        id     = 'text_role',
                        widget = wibox.widget.textbox,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                left  = 3,
                right = 3,
                widget = wibox.container.margin
            },
            id     = 'background_role',
            widget = wibox.container.background,
            -- Add support for hover colors and an index label
            create_callback = function(self, c3, index, objects) --luacheck: no unused args
                self:get_children_by_id('index_role')[1].markup = '<b> '..index..' </b>'
            end,
            update_callback = function(self, c3, index, objects) --luacheck: no unused args
                self:get_children_by_id('index_role')[1].markup = '<b> '..index..' </b>'
            end,
        },
        buttons = awful.util.taglist_buttons
    }



    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Keyboard map indicator and switcher
    mykeyboardlayout = awful.widget.keyboardlayout()
    

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(18), bg = theme.bg_normal, fg = theme.fg_normal })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox,
            spr,
        },
        { -- central widgets
            layout = wibox.layout.align.horizontal,
            s.mytasklist, -- Middle widget
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            
            dark(wibox.widget.systray()),

            arrl_ld, arrl_dl,
            dark(mykeyboardlayout),
            
            arrl_ld, arrl_dl,
            dark(mpdicon),
            dark(theme.mpd.widget),
            
            arrl_ld, arrl_dl,
            dark(volicon),
            dark(theme.volume.widget),

            arrl_ld, arrl_dl,
            dark(memicon),
            dark(mem.widget),

            arrl_ld, arrl_dl,
            dark(cpuicon),
            dark(cpu.widget),

            arrl_ld, arrl_dl,
            dark(tempicon),
            dark(temp.widget),

            arrl_ld, arrl_dl,
            dark(baticon),
            dark(bat.widget),

            arrl_ld, arrl_dl,
            dark(neticon),
            dark(net.widget),

            arrl_ld, arrl_dl,
            dark(theme.weather.icon),
            dark(theme.weather.widget),

            arrl_ld, arrl_dl,
            dark(clock),

            arrl_ld, arrl_dl,
            dark(s.mylayoutbox),
        },
    }
end

return theme
