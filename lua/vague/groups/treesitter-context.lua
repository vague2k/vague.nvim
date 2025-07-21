local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

    --stylua: ignore
  local hl = {
    TreesitterContext           = { bg = c.line },
    TreesitterContextLineNumber = { fg = c.comment, bg = c.line },
  }

  return hl
end
return M
