local curr_internal_conf = require("vague.config.internal").current
local M = {}

M.set_highlights = function()
  local c = curr_internal_conf.colors
  vim.g.terminal_color_0 = c.line -- black
  vim.g.terminal_color_1 = c.error -- red
  vim.g.terminal_color_2 = c.keyword -- green
  vim.g.terminal_color_3 = c.warning -- yellow
  vim.g.terminal_color_4 = c.type -- blue
  vim.g.terminal_color_5 = c.parameter -- purple
  vim.g.terminal_color_6 = c.constant -- cyan
  vim.g.terminal_color_7 = c.fg -- white
  vim.g.terminal_color_8 = c.comment -- gray
  vim.g.terminal_color_9 = c.error -- red
  vim.g.terminal_color_10 = c.keyword -- green
  vim.g.terminal_color_11 = c.warning -- yellow
  vim.g.terminal_color_12 = c.type -- blue
  vim.g.terminal_color_13 = c.parameter -- purple
  vim.g.terminal_color_14 = c.constant -- cyan
  vim.g.terminal_color_15 = c.fg -- white
end
return M
