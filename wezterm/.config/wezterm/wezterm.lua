-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 19

config.color_scheme = "catppuccin-mocha"

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

-- config.window_background_opacity = 0.8
-- config.macos_window_background_blur = 10

config.keys = {
	-- split tmux window vertically
	{ key = "e", mods = "CMD", action = wezterm.action.SendString("\x02%") },
	-- split tmux window horizontally
	{ key = "e", mods = "SHIFT|CMD", action = wezterm.action.SendString('\x02"') },
	-- create a new tmux window
	{ key = "t", mods = "CMD", action = wezterm.action.SendString("\x02c") },
	-- switch to next tmux window
	{ key = "n", mods = "CMD", action = wezterm.action.SendString("\x02n") },
	-- switch to previous tmux window
	{ key = "p", mods = "CMD", action = wezterm.action.SendString("\x02p") },
	-- rename the current tmux window
	{ key = ",", mods = "CMD", action = wezterm.action.SendString("\x02,") },
	-- open interactive tmux session client
	{ key = "s", mods = "CMD", action = wezterm.action.SendString("\x02s") },
	-- toggle zoom state of the current tmux pane
	{ key = "z", mods = "CMD", action = wezterm.action.SendString("\x02z") },
	-- kill current pane
	{ key = "w", mods = "CMD", action = wezterm.action.SendString("\x02x") },
	-- select pane
	{ key = "h", mods = "CMD", action = wezterm.action.SendString("\x02h") },
	{ key = "j", mods = "CMD", action = wezterm.action.SendString("\x02j") },
	{ key = "k", mods = "CMD", action = wezterm.action.SendString("\x02k") },
	{ key = "l", mods = "CMD", action = wezterm.action.SendString("\x02l") },
	-- select tmux window
	{ key = "1", mods = "CMD", action = wezterm.action.SendString("\x021") },
	{ key = "2", mods = "CMD", action = wezterm.action.SendString("\x022") },
	{ key = "3", mods = "CMD", action = wezterm.action.SendString("\x023") },
	{ key = "4", mods = "CMD", action = wezterm.action.SendString("\x024") },
	{ key = "5", mods = "CMD", action = wezterm.action.SendString("\x025") },
	{ key = "6", mods = "CMD", action = wezterm.action.SendString("\x026") },
	{ key = "7", mods = "CMD", action = wezterm.action.SendString("\x027") },
	{ key = "8", mods = "CMD", action = wezterm.action.SendString("\x028") },
	{ key = "9", mods = "CMD", action = wezterm.action.SendString("\x029") },
	-- enter tmux copy mode
	{ key = "x", mods = "SHIFT|CMD", action = wezterm.action.SendString("\x02[") },
}

-- and finally, return the configuration to wezterm
return config
