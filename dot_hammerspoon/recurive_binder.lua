hs.loadSpoon("RecursiveBinder")
spoon.RecursiveBinder.escapeKey = { {}, "escape" } -- Press escape to abort
spoon.RecursiveBinder.showBindHelper = false

local singleKey = spoon.RecursiveBinder.singleKey

local PATH = "PATH=/opt/homebrew/bin "

local function go_to_space(space_index)
    os.execute(
        (PATH .. [[~/.config/yabai/focus_window_in_space.sh ]] .. space_index)
            .. [[ || ]]
            .. (PATH .. [[yabai -m space --focus ]] .. space_index)
    )
end

local keyMap = {
    -- [singleKey("a", "create a new Arc window")] = function()
    --     NewArcWindow()
    -- end,
    [singleKey("m", "toggle Messenger")] = function()
        ToggleScratchpad("Messenger")
    end,
    [singleKey("t", "create new space")] = function()
        os.execute(PATH .. [[~/.config/yabai/new_space.sh]])
    end,
    [singleKey("x", "close current space")] = function()
        os.execute(PATH .. [[yabai -m space --destroy mouse]])
    end,
    [singleKey("return", "create a new kitty window")] = function()
        os.execute([[/Applications/kitty.app/Contents/MacOS/kitty --single-instance --working-directory ~]])
    end,
    [singleKey("a", "recent space")] = function()
        go_to_space("recent")
    end,
    [singleKey("n", "next space")] = function()
        go_to_space("next")
    end,
    [singleKey("p", "prev space")] = function()
        go_to_space("prev")
    end,
    [singleKey("1", "space 1")] = function()
        go_to_space(1)
    end,
    [singleKey("2", "space 2")] = function()
        go_to_space(2)
    end,
    [singleKey("3", "space 3")] = function()
        go_to_space(3)
    end,
    [singleKey("4", "space 4")] = function()
        go_to_space(4)
    end,
    [singleKey("5", "space 5")] = function()
        go_to_space(5)
    end,
    [singleKey("6", "space 6")] = function()
        go_to_space(6)
    end,
    [singleKey("7", "space 7")] = function()
        go_to_space(7)
    end,
    [singleKey("8", "space 8")] = function()
        go_to_space(8)
    end,
    [singleKey("9", "space 9")] = function()
        go_to_space(9)
    end,
    [singleKey("0", "space 10")] = function()
        go_to_space(10)
    end,
}

hs.hotkey.bind({ "shift" }, "space", spoon.RecursiveBinder.recursiveBind(keyMap))
