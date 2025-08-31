local common_group = require("vague.groups.common")
local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors
  local common = common_group.get_colors(conf)

  -- stylua: ignore
  local hl = {
    FzfLuaHeaderBind = { fg = c.constant },
    FzfLuaHeaderText = { fg = c.parameter },
    FzfLuaBorder     = common["FloatBorder"],
    FzfLuaPathLineNr = { fg = c.string },
    FzfLuaPathColNr  = { fg = c.parameter },
    FzfLuaLivePrompt = { fg = c.constant },
    FzfLuaLiveSym    = { fg = c.string },
    FzfLuaBufNr      = { fg = c.string },
    FzfLuaBufFlagCur = { fg = c.keyword },
    FzfLuaBufFlagAlt = { fg = c.keyword },
    FzfLuaTabTitle   = { fg = c.type },
    FzfLuaTabMarker  = { fg = c.constant },
  }

  return hl
end
return M
