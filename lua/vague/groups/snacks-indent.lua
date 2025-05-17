local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    SnacksIndentChunk = {fg = c.comment},
    SnacksIndent      = {fg = c.comment},
    SnacksIndentScope = {fg = c.comment},
  }

  return hl
end
return M
