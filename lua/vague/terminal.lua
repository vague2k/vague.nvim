local c = require("vague.colors")
local M = {}

M.set_highlights = function()
  vim.g.terminal_color_0 = c.bg -- black
  vim.g.terminal_color_1 = c.error -- red
  vim.g.terminal_color_2 = c.plus -- green
  vim.g.terminal_color_3 = c.warning -- yellow
  vim.g.terminal_color_4 = c.hint -- blue
  vim.g.terminal_color_5 = c.property -- purple
  vim.g.terminal_color_6 = c.type -- cyan
  vim.g.terminal_color_7 = c.fg -- white
  vim.g.terminal_color_8 = c.floatBorder -- gray
  vim.g.terminal_color_9 = c.error -- red
  vim.g.terminal_color_10 = c.plus -- green
  vim.g.terminal_color_11 = c.warning -- yellow
  vim.g.terminal_color_12 = c.hint -- blue
  vim.g.terminal_color_13 = c.property -- purple
  vim.g.terminal_color_14 = c.type -- cyan
  vim.g.terminal_color_15 = c.fg -- white
end
return M
