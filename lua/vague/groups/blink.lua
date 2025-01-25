local common_group = require("vague.groups.common")
local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors
  local common = common_group.get_colors(conf)

  -- stylua: ignore
  local hl = {
    BlinkCmpDocBorder            = { fg = c.floatBorder, bg = "none" },                  -- border for completion documentation
    BlinkCmpGhostText            = { fg = c.comment },                                   -- ghost text in completion
    BlinkCmpLabel                = { fg = c.fg, bg = "none" },                           -- label for completion items
    BlinkCmpLabelDeprecated      = { fg = c.error, bg = "none", strikethrough = true },  -- deprecated label in completion
    BlinkCmpLabelMatch           = { fg = c.keyword },                                   -- matched label in completion items
    BlinkCmpMenu                 = common["Pmenu"],                                      -- menu for completion items
    BlinkCmpMenuBorder           = { fg = c.floatBorder, bg = "none" },                  -- border for completion menu
    BlinkCmpKind                 = { fg = c.comment },                                   -- kind of completion item
    BlinkCmpSignatureHelpBorder  = { fg = c.floatBorder, bg = "none" },                  -- border for signature help
  }

  return hl
end
return M
