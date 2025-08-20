--[[
Vague for Wezterm
------------------------------------

Installation:
1. Save this file as `vague.lua` in your `.config/wezterm/lua/` directory.

2. In your `wezterm.lua` config, load the theme:
   local theme = require("lua/vague")

3. Add to your config table:
   return {
     colors = theme.colors(),
     window_frame = theme.window_frame(), -- optional, only if using fancy tab bar
   }

--]]

local M = {}

function M.colors()
	return {
		foreground = "#cdcdcd",
		background = "#141415",

		cursor_bg = "#cdcdcd",
		cursor_fg = "#141415",
		cursor_border = "#cdcdcd",

		selection_fg = "#cdcdcd",
		selection_bg = "#252530",

		scrollbar_thumb = "#252530",
		split = "#252530",

		ansi = {
			"#252530",
			"#d8647e",
			"#7fa563",
			"#f3be7c",
			"#6e94b2",
			"#bb9dbd",
			"#aeaed1",
			"#cdcdcd",
		},
		brights = {
			"#606079",
			"#e08398",
			"#99b782",
			"#f5cb96",
			"#8ba9c1",
			"#c9b1ca",
			"#bebeda",
			"#d7d7d7",
		},
		tab_bar = {
			background = "#141415",
			active_tab = {
				bg_color = "#252530",
				fg_color = "#cdcdcd",
				intensity = "Normal",
				underline = "None",
				italic = false,
				strikethrough = false,
			},
			inactive_tab = {
				bg_color = "#141415",
				fg_color = "#606079",
				intensity = "Normal",
				underline = "None",
				italic = false,
				strikethrough = false,
			},
			inactive_tab_hover = {
				bg_color = "#252530",
				fg_color = "#cdcdcd",
				italic = false,
			},
			new_tab = {
				bg_color = "#141415",
				fg_color = "#6e94b2",
			},
			new_tab_hover = {
				bg_color = "#252530",
				fg_color = "#8ba9c1",
			},
			inactive_tab_edge = "#252530",
		},
	}
end

function M.window_frame() -- Fancy tab bar only
	return {
		active_titlebar_bg = "#141415",
		inactive_titlebar_bg = "#141415",
	}
end

return M
