local autoReload = require 'modules/auto-reload'
local sizeUp     = require 'modules/size-up'

autoReload.init()
sizeUp.init()

hs.window.setShadows(false)
hs.window.highlight.ui.overlay = true
hs.window.highlight.ui.overlayColor = {0, 0, 0, 0.00001}
hs.window.highlight.ui.isolateColor = {0, 0, 0, 0.9}
hs.window.highlight.ui.frameColor = {1, 0, 0, 1}
hs.window.highlight.ui.frameWidth = 5
-- hs.window.highlight.ui.flashDuration = 0.3
-- hs.window.highlight.ui.windowHiddenFlashColor = {0, 0, 0, 0}
hs.window.highlight.start()

hs.hotkey.bind('ctrl-cmd', '\\', hs.window.highlight.toggleIsolate)
