local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local utilities = require("vague.utilities")
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    MiniDiffOverAdd = { fg = c.plus, bg = utilities.blend(c.plus, c.bg, 0.2) },
    MiniDiffOverChange = { fg = c.delta, bg = utilities.blend(c.delta, c.bg, 0.2)},
    MiniDiffOverContext = { bg = c.line },
    MiniDiffOverDelete = { fg = c.error, bg = utilities.blend(c.error, c.bg, 0.2) },
    MiniDiffSignAdd     = { fg = c.plus },
    MiniDiffSignChange  = { fg = c.delta },
    MiniDiffSignDelete  = { fg = c.error },

    MiniTrailspace = { bg = c.error },
  }

  return hl
end
return M
