local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    MiniDiffOverContext = { bg = c.line },
    MiniDiffSignAdd     = { fg = c.plus },
    MiniDiffSignChange  = { fg = c.delta },
    MiniDiffSignDelete  = { fg = c.error },

    MiniTrailspace      = { bg = c.error },

    MiniStatuslineModeNormal  = { fg = c.bg, bg = c.operator, gui = "bold" },
    MiniStatuslineModeInsert  = { fg = c.bg, bg = c.delta, gui = "bold" },
    MiniStatuslineModeVisual  = { fg = c.bg, bg = c.builtin, gui = "bold" },
    MiniStatuslineModeReplace = { fg = c.bg, bg = c.string, gui = "bold" },
    MiniStatuslineModeCommand = { fg = c.bg, bg = c.string, gui = "bold" },
    MiniStatuslineModeOther   = { fg = c.bg, bg = c.string, gui = "bold" },
    MiniStatuslineDevinfo     = { fg = c.fg, bg = c.inactiveBg },
    MiniStatuslineFilename    = { fg = c.comment, bg = c.bg },
    MiniStatuslineFileinfo    = { fg = c.fg, bg = c.inactiveBg },
    MiniStatuslineInactive    = { fg = c.comment, bg = c.bg },
  }

  return hl
end
return M
