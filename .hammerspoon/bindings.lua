local YABAI = "/opt/homebrew/bin/yabai"

local leader_mode = hs.hotkey.modal.new("shift", "space")

leader_mode:bind("", "escape", function()
    leader_mode:exit()
end)

leader_mode:bind("", "m", function()
    ToggleScratchpad("Messenger")
    leader_mode:exit()
end)

-- leader_mode:bind("", "n", function()
--     ToggleScratchpad("Heptabase")
--     leader_mode:exit()
-- end)

-- debug query
leader_mode:bind("shift", "q", function()
    os.execute(YABAI .. [[ -m query --windows --space > /tmp/query]])
    leader_mode:exit()
end)

local function quick_note()
    hs.eventtap.keyStroke({ "fn" }, "q")
end
leader_mode:bind("", "q", function()
    local app = hs.application.find("Notes", true)
    if app ~= nil and app:isFrontmost() then
        app:hide()
        return
    else
        quick_note()
    end
end)

-- open new arc windows
local function new_arc_window()
    local arc_app = hs.application.find("Arc", true)
    if arc_app == nil then
        hs.application.launchOrFocus("Arc")
    else
        hs.eventtap.keyStroke({ "command" }, "n", 0, arc_app)
    end
end
local function new_icognito_arc_window()
    local arc_app = hs.application.find("Arc", true)
    if arc_app == nil then
        hs.application.launchOrFocus("Arc")
    else
        hs.eventtap.keyStroke({ "command", "shift" }, "n", 0, arc_app)
    end
end
leader_mode:bind("", "b", function()
    new_arc_window()
    leader_mode:exit()
end)
leader_mode:bind("shift", "b", function()
    new_icognito_arc_window()
    leader_mode:exit()
end)

-- interact with spaces
leader_mode:bind("", "t", function()
    os.execute([[~/.config/yabai/new_space.sh]])
    leader_mode:exit()
end)
leader_mode:bind("", "x", function()
    os.execute(YABAI .. [[ -m space --destroy mouse]])
    leader_mode:exit()
end)

local function go_to_space(space_index)
    os.execute(
        ([[~/.config/yabai/focus_window_in_space.sh ]] .. space_index)
            .. [[ || ]]
            .. (YABAI .. [[ -m space --focus ]] .. space_index)
    )
end
leader_mode:bind("", "r", function()
    go_to_space("recent")
    leader_mode:exit()
end)
leader_mode:bind("", "l", function()
    go_to_space("next")
    leader_mode:exit()
end)
leader_mode:bind("", "h", function()
    go_to_space("prev")
    leader_mode:exit()
end)
for i = 1, 9 do
    leader_mode:bind("", tostring(i), function()
        go_to_space(i)
        leader_mode:exit()
    end)
end
leader_mode:bind("", "0", function()
    go_to_space(10)
    leader_mode:exit()
end)

-- new kitty instance
leader_mode:bind("", "return", function()
    os.execute([[/Applications/kitty.app/Contents/MacOS/kitty --single-instance --working-directory ~]])
    leader_mode:exit()
end)

-- lock mode to avoid triggering shift-space
local lock_mode = hs.hotkey.modal.new("ctrl-shift", "space")

function lock_mode:entered()
    hs.alert("entered lock mode")
    leader_mode:exit()
end
function lock_mode:exited()
    hs.alert("exited lock mode")
    leader_mode:exit()
end

lock_mode:bind({ "ctrl", "shift" }, "space", function()
    lock_mode:exit()
end)

-- shadow leader mode keybinding
lock_mode:bind({ "shift" }, "space", function()
    hs.alert("lock mode activated")
end)
