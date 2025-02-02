local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    NeoTreeNormal           = { fg = c.fg, bg = conf.transparent and "none" or c.bg },            -- normal text in NeoTree
    NeoTreeNormalNC         = { fg = c.fg, bg = conf.transparent and "none" or c.bg },            -- normal text in NeoTree (non-current)
    NeoTreeVertSplit        = { fg = c.comment, bg = conf.transparent and "none" or c.comment },  -- vertical split in NeoTree
    NeoTreeWinSeparator     = { fg = c.comment, bg = conf.transparent and "none" or c.comment },  -- window separator in NeoTree
    NeoTreeEndOfBuffer      = { fg = c.comment, bg = conf.transparent and "none" or c.bg },       -- end of buffer in NeoTree
    NeoTreeRootName         = { fg = c.hint, fmt = "bold" },                                      -- root directory name in NeoTree
    NeoTreeGitAdded         = { fg = c.plus },                                                    -- added Git changes in NeoTree
    NeoTreeGitDeleted       = { fg = c.error },                                                   -- deleted Git changes in NeoTree
    NeoTreeGitModified      = { fg = c.delta },                                                   -- modified Git changes in NeoTree
    NeoTreeGitConflict      = { fg = c.error, fmt = "bold,italic" },                              -- Git conflict in NeoTree
    NeoTreeGitUntracked     = { fg = c.error, fmt = "italic" },                                   -- untracked Git files in NeoTree
    NeoTreeIndentMarker     = { fg = c.comment },                                                 -- indent markers in NeoTree
    NeoTreeSymbolicLinkTarget = { fg = c.hint },                                                  -- symbolic links in NeoTree
  }

  return hl
end
return M
