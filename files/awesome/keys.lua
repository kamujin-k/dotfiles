
local _config = {}

function _config.init()
    local keys = {
        super           = "Mod4",
        alt             = "Mod1",
        ctrl            = "Control",
        shift           = "Shift",

        enter           = "Return",
        space           = "space",
        escape          = "Escape",
        tab             = "Tab",

        vim_left        = "h",
        vim_right       = "l",
        vim_up          = "k",
        vim_down        = "j",

        arrow_left      = "Left",
        arrow_right     = "Right",
        arrow_up        = "Up",
        arrow_down      = "Down",
    }

    return keys
end

return _config
