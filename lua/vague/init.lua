local internal_conf = require("vague.config.internal")
local M = {}

---@param user_opts? VagueColorscheme.Config
M.setup = function(user_opts)
  if user_opts then internal_conf.set(user_opts) end
end

-- SHOULD BE CALLED AFTER SETUP (unless using default colors)
M.get_palette = function()
  local palette = {}
  for name, color in pairs(internal_conf.current.colors) do
    palette[name] = color
  end
  return palette
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
