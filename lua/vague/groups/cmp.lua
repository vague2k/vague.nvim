local common_group = require("vague.groups.common")
local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors
  local common = common_group.get_colors(conf)

  -- stylua: ignore
  local hl = {
    CmpGhostText          = { fg = c.comment },                                   -- ghost text for completion
    CmpItemAbbr           = { fg = c.fg, bg = "none" },                           -- abbreviation in completion menu
    CmpItemAbbrDeprecated = { fg = c.error, bg = "none", strikethrough = true },  -- deprecated items in completion menu
    CmpItemAbbrMatch      = { fg = c.delta, gui = conf.plugins.cmp.match },       -- matched text in completion menu
    CmpItemAbbrMatchFuzzy = { fg = c.delta, gui = conf.plugins.cmp.match_fuzzy }, -- fuzzy-matched text in completion menu
    CmpItemMenu           = common["Pmenu"],                                      -- menu for completion items
    CmpItemKind           = { fg = c.comment },                                   -- kind of completion item
  }

  return hl
end
return M
