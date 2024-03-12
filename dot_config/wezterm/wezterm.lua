-- Pull in the wezterm API
local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font_with_fallback({
	{ family = "Victor Mono", weight = "Medium" },
	"Symbols Nerd Font",
	"Lantinghei TC",
})

config.font_size = 16.0

return config
