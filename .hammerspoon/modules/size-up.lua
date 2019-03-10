local hotkey   = require 'hs.hotkey'
local bind     = hotkey.bind

local function getAllVisibleWindowsInMainScreen()
    local currentScreen = hs.window.focusedWindow():screen()
    local visibleWindows = hs.window.visibleWindows()
    local windows = {}
    for i, window in ipairs(visibleWindows) do
        if ( currentScreen == window:screen() )
        then
            table.insert(windows, window)
        end
    end
    return windows
end

local function getWindowProperties(window)
    local frame = window:frame()
    local screen = window:screen()
    return frame, screen
end

local function moveWindowToUpperLeft(window)
    local frame, screen = getWindowProperties(window)
    local max = screen:frame()

    frame.x = max.x
    frame.y = max.y
    frame.w = max.w / 2
    frame.h = max.h / 2
    window:setFrame(frame, 0)
end

local function moveWindowToUpperRight(window)
    local frame, screen = getWindowProperties(window)
    local max = screen:frame()

    frame.x = max.x + (max.w / 2)
    frame.y = max.y
    frame.w = max.w / 2
    frame.h = max.h / 2
    window:setFrame(frame, 0)
end

local function moveWindowToLowerLeft(window)
    local frame, screen = getWindowProperties(window)
    local max = screen:frame()

    frame.x = max.x
    frame.y = max.y + (max.h / 2)
    frame.w = max.w / 2
    frame.h = max.h / 2
    window:setFrame(frame, 0)
end

local function moveWindowToLowerRight(window)
    local frame, screen = getWindowProperties(window)
    local max = screen:frame()

    frame.x = max.x + (max.w / 2)
    frame.y = max.y + (max.h / 2)
    frame.w = max.w / 2
    frame.h = max.h / 2
    window:setFrame(frame, 0)
end

local function moveWindowToLeft(window)
    local frame, screen = getWindowProperties(window)
    local max = screen:frame()

    frame.x = max.x
    frame.y = max.y
    frame.w = max.w / 2
    frame.h = max.h
    window:setFrame(frame, 0)
end

local function moveWindowToRight(window)
    local frame, screen = getWindowProperties(window)
    local max = screen:frame()

    frame.x = max.x + (max.w / 2)
    frame.y = max.y
    frame.w = max.w / 2
    frame.h = max.h
    window:setFrame(frame, 0)
end

local function moveWindowToUp(window)
    local frame, screen = getWindowProperties(window)
    local max = screen:frame()

    frame.x = max.x
    frame.y = max.y
    frame.w = max.w
    frame.h = max.h / 2
    window:setFrame(frame, 0)
end

local function moveWindowToDown(window)
    local frame, screen = getWindowProperties(window)
    local max = screen:frame()

    frame.x = max.x
    frame.y = max.y + (max.h / 2)
    frame.w = max.w
    frame.h = max.h / 2
    window:setFrame(frame, 0)
end

local function moveWindowToCenter(window)
    local frame, screen = getWindowProperties(window)
    local max = screen:frame()

    frame.x = max.x + (max.w / 4)
    frame.y = max.y + (max.h / 4)
    frame.w = max.w / 2
    frame.h = max.h / 2
    window:setFrame(frame, 0)
end

local function maximizeWindow(window)
    local frame, screen = getWindowProperties(window)
    local max = screen:frame()

    frame.x = max.x
    frame.y = max.y
    frame.w = max.w
    frame.h = max.h
    window:setFrame(frame, 0)
end

local function moveWindowToPreviousScreen(window)
    local frame, screen = getWindowProperties(window)
    window:moveToScreen(screen:previous(), false, true, 0)
end

local function moveWindowToNextScreen(window)
    local frame, screen = getWindowProperties(window)
    window:moveToScreen(screen:next(), false, true, 0)
end

local function module_init()
    -- Move to Previous Screen
    bind({"alt", "ctrl"}, "Left", function()
        moveWindowToPreviousScreen(hs.window.focusedWindow())
    end)

    -- Move to Next Screen
    bind({"alt", "ctrl"}, "Right", function()
        moveWindowToNextScreen(hs.window.focusedWindow())
    end)

    -- Upper Left
    bind({"shift", "alt", "ctrl"}, "Left", function()
        moveWindowToUpperLeft(hs.window.focusedWindow())
    end)

    -- Upper Right
    bind({"shift", "alt", "ctrl"}, "Up", function()
        moveWindowToUpperRight(hs.window.focusedWindow())
    end)

    -- Lower Left
    bind({"shift", "alt", "ctrl"}, "Down", function()
        moveWindowToLowerLeft(hs.window.focusedWindow())
    end)

    -- Lower Right
    bind({"shift", "alt", "ctrl"}, "Right", function()
        moveWindowToLowerRight(hs.window.focusedWindow())
    end)

    -- Left
    bind({"cmd", "alt", "ctrl"}, "Left", function()
        moveWindowToLeft(hs.window.focusedWindow())
    end)

    -- Right
    bind({"cmd", "alt", "ctrl"}, "Right", function()
        moveWindowToRight(hs.window.focusedWindow())
    end)

    -- Up
    bind({"cmd", "alt", "ctrl"}, "Up", function()
        moveWindowToUp(hs.window.focusedWindow())
    end)

    -- Down
    bind({"cmd", "alt", "ctrl"}, "Down", function()
        moveWindowToDown(hs.window.focusedWindow())
    end)

    -- Maximize
    bind({"cmd", "alt", "ctrl"}, "M", function()
        maximizeWindow(hs.window.focusedWindow())
    end)

    -- Center
    bind({"cmd", "alt", "ctrl"}, "C", function()
        moveWindowToCenter(hs.window.focusedWindow())
    end)

    -- Left all in the current screen
    bind({"cmd", "alt", "ctrl", "shift"}, "Left", function()
        local visibleWindows = getAllVisibleWindowsInMainScreen()
        for i, visibleWindow in ipairs(visibleWindows) do
            moveWindowToLeft(visibleWindow)
        end
    end)

    -- Right all in the current screen
    bind({"cmd", "alt", "ctrl", "shift"}, "Right", function()
        local visibleWindows = getAllVisibleWindowsInMainScreen()
        for i, visibleWindow in ipairs(visibleWindows) do
            moveWindowToRight(visibleWindow)
        end
    end)

    -- Up all in the current screen
    bind({"cmd", "alt", "ctrl", "shift"}, "Up", function()
        local visibleWindows = getAllVisibleWindowsInMainScreen()
        for i, visibleWindow in ipairs(visibleWindows) do
            moveWindowToUp(visibleWindow)
        end
    end)

    -- Down all in the current screen
    bind({"cmd", "alt", "ctrl", "shift"}, "Down", function()
        local visibleWindows = getAllVisibleWindowsInMainScreen()
        for i, visibleWindow in ipairs(visibleWindows) do
            moveWindowToDown(visibleWindow)
        end
    end)

    -- Maximize all in the current screen
    bind({"cmd", "alt", "ctrl", "shift"}, "M", function()
        local visibleWindows = getAllVisibleWindowsInMainScreen()
        for i, visibleWindow in ipairs(visibleWindows) do
            maximizeWindow(visibleWindow)
        end
    end)

end

return {
    init = module_init
}
