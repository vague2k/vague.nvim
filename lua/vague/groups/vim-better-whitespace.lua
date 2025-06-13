local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    ExtraWhitespace = { fg = c.fg, bg = c.error }, -- Border for Telescope
  }

  return hl
end
return M
