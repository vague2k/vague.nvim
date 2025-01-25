local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    DashboardShortCut = { fg = c.constant },
    DashboardHeader   = { fg = c.keyword },
    DashboardCenter   = { fg = c.fg },
    DashboardFooter   = { fg = c.parameter, gui = "italic" },
  }

  return hl
end
return M
