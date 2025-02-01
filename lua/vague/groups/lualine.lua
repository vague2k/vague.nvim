local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- Reference https://github.com/nvim-lualine/lualine.nvim/raw/refs/heads/master/lua/lualine/themes/iceberg_dark.lua
  local colors = {
    color2 = c.bg,
    color3 = c.builtin,
    color4 = c.property,
    color5 = c.line,
    color8 = c.string,
    color9 = c.property,
    color10 = "#1c1c24",
    color11 = c.bg,
    color12 = c.operator,
    color15 = c.delta,
  }

  return {
    visual = {
      a = { fg = colors.color2, bg = colors.color3, gui = "bold" },
      b = { fg = colors.color4, bg = colors.color5 },
    },
    replace = {
      a = { fg = colors.color2, bg = colors.color8, gui = "bold" },
      b = { fg = colors.color4, bg = colors.color5 },
    },
    inactive = {
      a = { fg = colors.color9, bg = colors.color10, gui = "bold" },
      b = { fg = colors.color9, bg = colors.color10 },
      c = { fg = colors.color9, bg = colors.color10 },
    },
    normal = {
      a = { fg = colors.color11, bg = colors.color12, gui = "bold" },
      b = { fg = colors.color4, bg = colors.color5 },
      c = { fg = colors.color4, bg = colors.color10 },
    },
    insert = {
      a = { fg = colors.color2, bg = colors.color15, gui = "bold" },
      b = { fg = colors.color4, bg = colors.color5 },
    },
  }
end

return M
