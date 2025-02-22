local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    SnacksInputBorder = {fg = c.floatBorder},
    SnacksInputPrompt = {fg = c.comment},
    SnacksInputTitle  = {fg = c.constant},
    SnacksInputIcon   = {fg = c.constant},
  }

  return hl
end
return M
