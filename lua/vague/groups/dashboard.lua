local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    DashboardShortCut = { fg = c.parameter },
    DashboardHeader   = { fg = c.constant },
    DashboardCenter   = { fg = c.constant },
    DashboardFooter   = { fg = c.delta, gui = conf.plugins.dashboard.footer},
  }

  return hl
end
return M
