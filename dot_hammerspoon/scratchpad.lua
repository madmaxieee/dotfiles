return function(app_name)
    local spaceID = hs.spaces.focusedSpace()
    local app = hs.application.get(app_name)

    if app ~= nil then
        if not app:mainWindow() then
            hs.application.launchOrFocus(app_name)
        elseif app:isFrontmost() then
            app:hide()
        else
            hs.spaces.moveWindowToSpace(app:mainWindow(), spaceID)
            app:activate()
        end
    else
        hs.application.launchOrFocus(app_name)
        app = hs.application.get(app_name)
        app:activate()
    end
end
