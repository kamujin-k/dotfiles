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
local k             = require("keys").init()


local actions = {}

function actions.switch_monitor_display_mode(args)
    xrandr.xrandr()
end

function actions.take_a_screenshot(args)

end

function actions.lock_screen(args)
    os.execute(scrlocker)
end

function actions.increase_brightness(args)

end
function actions.decrease_brightness(args)

end
function actions.volume_up(args)

end
function actions.volume_down(args)

end
function actions.toggle_mute(args)

end
function actions.volume_max(args)

end
function actions.volume_min(args)

end
function actions.copy_terminal_to_gtk(args)

end
function actions.copy_gtk_to_terminal(args)

end


function actions.view_tag(args)

end
function actions.toggle_tag(args)

end
function actions.move_focused_client_to_tag(args)

end
function actions.toggle_focused_client_on_tag(args)

end
function actions.view_previous_tag(args)

end
function actions.view_next_tag(args)

end
function actions.return_to_previous_tag(args)

end
function actions.view__previous_nonempty(args)

end
function actions.view__previous_nonempty(args)

end
function actions.increment_useless_gaps(args)

end
function actions.decrement_useless_gaps(args)

end
function actions.add_new_tag(args)

end
function actions.rename_tag(args)

end
function actions.move_tag_to_the_left(args)

end
function actions.move_tag_to_the_right(args)

end
function actions.delete_tag(args)

end


function actions.show_help(args)

end
function actions.show_main_menu(args)

end
function actions.toggle_wibox(args)

end
function actions.reload_awesome(args)

end
function actions.quit_awesome(args)

end
function actions.lua_execute_prompt(args)

end


function actions.focus_next_by_index(params)

end
function actions.focus_previous_by_index(params)

end
function actions.focus_down(params)

end
function actions.focus_up(params)

end
function actions.focus_left(params)

end
function actions.focus_right(params)

end
function actions.focus_down(params)

end
function actions.focus_up(params)

end
function actions.focus_left(params)

end
function actions.focus_right(params)

end
function actions.swap_with_next_client_by_index(params)

end
function actions.swap_with_previous_client_by_index(params)

end
function actions.jump_to_urgent_client(params)

end
function actions.cycle_with_previous(params)

end
function actions.go_forth(params)

end
function actions.restore_minimized(params)

end
function actions.magnify_client(params)

end
function actions.toggle_fullscreen(params)

end
function actions.close(params)

end
function actions.toggle_floating(params)

end
function actions.move_to_master(params)

end
function actions.move_to_screen(params)

end
function actions.toggle_keep_on_top(params)

end
function actions.minimize(params)

end
function actions.maximize(params)

end
function actions.toggle_titlebar(params)

end

function actions.focus_next_screen(params)

end

function actions.focus_previous_screen(params)

end

function actions.increase_master_width(params)

end

function actions.decrease_master_width(params)

end

function actions.increase_number_of_master_clients(params)

end

function actions.decrease_number_of_master_clients(params)

end

function actions.increase_number_of_columns(params)

end

function actions.decrease_number_of_columns(params)

end

function actions.next_layout(params)

end

function actions.previous_layout(params)

end

function actions.show_calendar(params)

end

function actions.show_filesystem(params)

end

function actions.show_weather(params)

end

function actions.mpc_toggle(params)

end

function actions.mpc_stop(params)

end

function actions.mpc_prev(params)

end

function actions.mpc_next(params)

end

function actions.mpc_on_off(params)

end


function actions.launch_browser(params)

end

function actions.run_text_editor(params)

end

function actions.show_the_menubar(params)

end

function actions.show_rofi(params)

end

function actions.run_prompt(params)

end

function actions.dropdown_application(params)

end

function actions.open_a_terminal(params)

end

return actions