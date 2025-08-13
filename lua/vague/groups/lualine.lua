local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  return {
    visual = {
      a = { fg = c.bg, bg = c.builtin, gui = "bold" },
      b = { fg = c.property, bg = c.line },
    },
    replace = {
      a = { fg = c.bg, bg = c.string, gui = "bold" },
      b = { fg = c.property, bg = c.line },
    },
    inactive = {
      a = { fg = c.property, bg = c.inactiveBg, gui = "bold" },
      b = { fg = c.property, bg = c.inactiveBg },
      c = { fg = c.property, bg = c.inactiveBg },
    },
    normal = {
      a = { fg = c.bg, bg = c.operator, gui = "bold" },
      b = { fg = c.property, bg = c.line },
      c = { fg = c.property, bg = c.inactiveBg },
    },
    insert = {
      a = { fg = c.bg, bg = c.delta, gui = "bold" },
      b = { fg = c.property, bg = c.line },
    },
  }
end

return M
