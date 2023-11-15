require("hs.ipc")
require("reload")
require("wallpaper")

local scratchpad = require("scratchpad")
hs.hotkey.bind({ "command" }, "`", function()
    scratchpad("kitty")
end)
