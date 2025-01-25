local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    GitSignsAdd        = { fg = c.plus },    -- added lines in Git
    GitSignsAddLn      = { fg = c.plus },    -- added line numbers in Git
    GitSignsAddNr      = { fg = c.plus },    -- added line numbers in Git
    GitSignsChange     = { fg = c.delta },   -- changed lines in Git
    GitSignsChangeLn   = { fg = c.delta },   -- changed line numbers in Git
    GitSignsChangeNr   = { fg = c.delta },   -- changed line numbers in Git
    GitSignsDelete     = { fg = c.error },   -- deleted lines in Git
    GitSignsDeleteLn   = { fg = c.error },   -- deleted line numbers in Git
    GitSignsDeleteNr   = { fg = c.error },   -- deleted line numbers in Git
  }

  return hl
end
return M
