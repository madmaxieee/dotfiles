local function toggle_scratchpad(app_name)
    local app = hs.application.find(app_name, true)

    if not app then
        hs.application.launchOrFocus(app_name)
        return
    end

    if not app:mainWindow() then
        hs.application.launchOrFocus(app_name)
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
