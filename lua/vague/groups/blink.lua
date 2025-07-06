local cmp_group = require("vague.groups.cmp")
local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors
  local cmp = cmp_group.get_colors(conf)

  -- stylua: ignore
  local hl = {
    BlinkCmpDocBorder            = { fg = c.floatBorder, bg = "none" },  -- border for completion documentation
    BlinkCmpGhostText            = cmp["CmpGhostText"],                  -- ghost text in completion
    BlinkCmpLabel                = cmp["CmpItemAbbr"],                   -- label for completion items
    BlinkCmpLabelDeprecated      = cmp["CmpItemAbbrDeprecated"],         -- deprecated label in completion
    BlinkCmpLabelMatch           = cmp["CmpItemAbbrMatch"],              -- matched label in completion items
    BlinkCmpMenu                 = cmp["CmpItemMenu"],                   -- menu for completion items
    BlinkCmpMenuBorder           = { fg = c.floatBorder, bg = "none" },  -- border for completion menu
    BlinkCmpKind                 = cmp["CmpKind"],                       -- kind of completion item
    BlinkCmpSignatureHelpBorder  = { fg = c.floatBorder, bg = "none" },  -- border for signature help
  }

  return hl
end
return M
