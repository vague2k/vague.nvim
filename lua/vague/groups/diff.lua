local utilities = require("vague.utilities")
local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    Added         = { fg = c.plus },
    Changed       = { fg = c.delta },
    Removed       = { fg = c.error },
    DiffAdd       = { bg = utilities.blend(c.plus, c.bg, 0.2) },
    DiffChange    = { bg = utilities.blend(c.delta, c.bg, 0.2) },
    DiffDelete    = { bg = utilities.blend(c.error, c.bg, 0.2) },
    DiffText      = { fg = c.fg },
    DiffFile      = { fg = c.keyword },
    DiffIndexLine = { fg = c.comment },
  }

  return hl
end
return M
