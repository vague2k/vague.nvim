local config = require("vague.config")
local M = {}

---@param user_opts? VagueConfig
M.setup = function(user_opts)
  if user_opts then config.set(user_opts) end
end

--- Under the hood, |:colorscheme| is just using |:highlight GroupName ...| over every highlight group it knows about.
--- so this function is the equivalent to calling |:colorscheme| so use that instead
M._colorscheme = function()
  vim.cmd("highlight clear")
  if vim.fn.has("syntax_on") then vim.cmd("syntax reset") end
  vim.g.colors_name = "vague"

  require("vague.highlights").set_highlights()
  require("vague.terminal").set_highlights()
end

return M
