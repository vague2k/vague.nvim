local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    MiniDiffOverContext = { bg = c.line },
    MiniDiffSignAdd     = { fg = c.plus },
    MiniDiffSignChange  = { fg = c.delta },
    MiniDiffSignDelete  = { fg = c.error },

    MiniTrailspace      = { bg = c.error },
  }

  return hl
end
return M
