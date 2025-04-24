local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    RainbowDelimiterRed    = { fg = c.error },
    RainbowDelimiterOrange = { fg = c.func },
    RainbowDelimiterYellow = { fg = c.warning },
    RainbowDelimiterGreen  = { fg = c.plus },
    RainbowDelimiterBlue   = { fg = c.hint },
    RainbowDelimiterViolet = { fg = c.parameter },
    RainbowDelimiterCyan   = { fg = c.keyword },
  }

  return hl
end
return M
