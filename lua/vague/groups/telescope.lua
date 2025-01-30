local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    TelescopeBorder           = { fg = c.floatBorder },                                -- Border for Telescope
    TelescopeMatching         = { fg = c.delta, gui = conf.plugins.telescope.match },  -- Matching text in Telescope
    TelescopePromptPrefix     = { fg = c.constant },                                   -- Prefix in Telescope prompt
    TelescopeSelection        = { fg = c.constant, bg = c.line },                      -- Selection in Telescope
    TelescopeSelectionCaret   = { fg = c.constant },                                       -- Caret in Telescope selection
    TelescopeResultsNormal    = { fg = c.fg },                                         -- Normal text in Telescope results

  }

  return hl
end
return M
