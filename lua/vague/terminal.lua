local curr_internal_conf = require("vague.config.internal").current
local M = {}

M.set_highlights = function()
  local c = curr_internal_conf.colors
  vim.g.terminal_color_0 = c.line -- black
  vim.g.terminal_color_1 = c.error -- red
  vim.g.terminal_color_2 = c.plus -- green
  vim.g.terminal_color_3 = c.warning -- yellow
  vim.g.terminal_color_4 = c.keyword -- blue
  vim.g.terminal_color_5 = c.parameter -- purple
  vim.g.terminal_color_6 = c.constant -- cyan
  vim.g.terminal_color_7 = c.fg -- white
  vim.g.terminal_color_8 = c.comment -- gray
  vim.g.terminal_color_9 = "#e08398" -- red
  vim.g.terminal_color_10 = "#99b782" -- green
  vim.g.terminal_color_11 = "#f5cb96" -- yellow
  vim.g.terminal_color_12 = "#8ba9c1" -- blue
  vim.g.terminal_color_13 = "#c9b1ca" -- purple
  vim.g.terminal_color_14 = "#bebeda" -- cyan
  vim.g.terminal_color_15 = c.fg -- white
end
return M
