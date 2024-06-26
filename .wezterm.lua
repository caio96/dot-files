-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.color_scheme = 'Gruvbox dark, hard (base16)'
config.font = wezterm.font 'FiraCode NerdFont Mono'
config.font_size = 11
config.enable_scroll_bar = true
config.check_for_updates = false

config.keys = {
  {
    key = 'F11',
    action = wezterm.action.ToggleFullScreen,
  },
}

-- and finally, return the configuration to wezterm
return config
