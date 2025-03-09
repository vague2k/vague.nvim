local telescope_group = require("vague.groups.telescope")
local neotree_group = require("vague.groups.neotree")
local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local telescope = telescope_group.get_colors(conf)
  local neotree = neotree_group.get_colors(conf)

  -- stylua: ignore
  local hl = {
    SnacksPickerMatch              = telescope["TelescopeMatching"],     -- Matching text in picker 
    SnacksPickerPrompt             = telescope["TelescopePromptPrefix"], -- Prefix in picker prompt
    SnacksPickerBorder             = telescope["TelescopeBorder"],       -- Border for Telescope
    SnacksPickerBoxBorder          = telescope["TelescopeBorder"],       -- Border for Telescope
    SnacksPickerListBorder         = telescope["TelescopeBorder"],       -- Border for Telescope
    SnacksPickerInputBorder        = telescope["TelescopeBorder"],       -- Border for Telescope
    SnacksPickerPrewviewBorder     = telescope["TelescopeBorder"],       -- Border for Telescope
    SnacksPickerCursorLine         = telescope["TelescopeSelection"],    -- Selection in picker
    SnacksPickerBoxCursorLine      = telescope["TelescopeSelection"],    -- Selection in picker
    SnacksPickerListCursorLine     = telescope["TelescopeSelection"],    -- Selection in picker
    SnacksPickerInputCursorLine    = telescope["TelescopeSelection"],    -- Selection in picker
    SnacksPickerPreviewCursorLine  = telescope["TelescopeSelection"],    -- Selection in picker
    SnacksPickerGitStatusUntracked = neotree["NeoTreeGitUntracked"],     -- color of untracked git items in a picker (usually explorer)
    SnacksPickerGitStatusAdded     = neotree["NeoTreeGitAdded"],         -- color of added git items in a picker (usually explorer)
    SnacksPickerGitStatusModified  = neotree["NeoTreeGitModified"],      -- color of modified git items in a picker (usually explorer)
    SnacksPickerGitStatusStaged    = neotree["NeoTreeGitAdded"],         -- color of added git items in a picker (usually explorer)
  }

  return hl
end
return M
