local pathwatcher   = require 'hs.pathwatcher'
local screenwatcher = require 'hs.screen.watcher'
local alert         = require 'hs.alert'

-- Reload the hammerspoon configuration whenever there is a change in hammerspoon config (.lua) files
local function reloadConfig(files)
    local doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end

return {
    init = function ()
        pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
        screenwatcher.new(function ()
            hs.reload()
        end):start()
        print("HammerSpoon Config Re-loaded")
    end
}
