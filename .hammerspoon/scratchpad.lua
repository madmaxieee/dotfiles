local function toggle_scratchpad(app_name)
    local app = hs.application.find(app_name, true)

    if not app then
        hs.application.launchOrFocus(app_name)
        return
    end

    if not app:mainWindow() then
        hs.application.launchOrFocus(app_name)

        -- TODO: use faster gotoSpace implemented with yabai
        --
        -- local YABAI = "/opt/homebrew/bin/yabai"
        -- local spaceID = hs.spaces.focusedSpace()
        -- local spaceIndex =
        --     os.execute(YABAI .. [[ -m query --spaces | jq '.[] | select(."id"==]] .. spaceID .. [[) | .index']])
        -- hs.application.launchOrFocus(app_name)
        -- hs.timer.doAfter(0.05, function()
        --     os.execute(YABAI .. [[ -m space focus ]] .. spaceIndex)
        --     hs.spaces.moveWindowToSpace(app:mainWindow(), spaceID)
        -- end)

        return
    end

    if app:isFrontmost() then
        app:hide()
        return
    else
        local spaceID = hs.spaces.focusedSpace()
        hs.spaces.moveWindowToSpace(app:mainWindow(), spaceID)
        app:activate()
    end
end

return toggle_scratchpad
