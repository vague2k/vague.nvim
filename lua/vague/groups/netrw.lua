local common_group = require("vague.groups.common")
local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors
  local common = common_group.get_colors(conf)

  -- stylua: ignore
  local hl = {
    netrwTreeBar  = { fg = c.comment },
    netrwClassify = common["Directory"],
  }

  return hl
end
return M
