local PATH = "PATH=/opt/homebrew/bin:/usr/bin "

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

local function quick_note()
    hs.eventtap.keyStroke({ "fn" }, "q")
end

hs.hotkey.bind("ctrl", "q", function()
    local app = hs.application.find("Notes", true)
    if app ~= nil and app:isFrontmost() then
        app:hide()
        return
    else
        quick_note()
    end
end)

local leader_mode = hs.hotkey.modal.new("shift", "space")

-- leader_mode:bind("", "n", function()
--     ToggleScratchpad("Heptabase")
--     leader_mode:exit()
-- end)

leader_mode:bind("", "escape", function()
    leader_mode:exit()
end)

leader_mode:bind("", "m", function()
    ToggleScratchpad("Messenger")
    leader_mode:exit()
end)

leader_mode:bind("shift", "q", function()
    os.execute(PATH .. [[yabai -m query --windows --space > /tmp/query]])
    leader_mode:exit()
end)

leader_mode:bind("", "b", function()
    new_arc_window()
    leader_mode:exit()
end)
leader_mode:bind("shift", "b", function()
    new_icognito_arc_window()
    leader_mode:exit()
end)

leader_mode:bind("", "t", function()
    os.execute(PATH .. [[~/.config/yabai/new_space.sh]])
    leader_mode:exit()
end)
leader_mode:bind("", "x", function()
    os.execute(PATH .. [[yabai -m space --destroy mouse]])
    leader_mode:exit()
end)

leader_mode:bind("", "return", function()
    os.execute([[/Applications/kitty.app/Contents/MacOS/kitty --single-instance --working-directory ~]])
    leader_mode:exit()
end)

local function go_to_space(space_index)
    os.execute(
        (PATH .. [[~/.config/yabai/focus_window_in_space.sh ]] .. space_index)
            .. [[ || ]]
            .. (PATH .. [[yabai -m space --focus ]] .. space_index)
    )
end

-- leader_mode:bind("", "r", function()
--     go_to_space("recent")
--     leader_mode:exit()
-- end)
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
