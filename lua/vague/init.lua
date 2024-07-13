local config = require("vague.config")
local M = {}

---@param user_opts? VagueConfig
M.setup = function(user_opts)
  if user_opts then config.set(user_opts) end

  require("vague.highlights").set_highlights()
end

---This is a thin internal wrapper over |:colorscheme|. Do not use this, just use |:colorscheme|
M._colorscheme = function()
  vim.cmd("highlight clear")
  if vim.fn.has("syntax_on") then vim.cmd("syntax reset") end
  vim.g.colors_name = "vague"

  require("vague.highlights").set_highlights()
end

return M
