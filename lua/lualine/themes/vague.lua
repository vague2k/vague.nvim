-- Reference https://github.com/nvim-lualine/lualine.nvim/raw/refs/heads/master/lua/lualine/themes/iceberg_dark.lua
-- stylua: ignore
local colors = {
  color2  = "#141415",
  color3  = "#b4be82",
  color4  = "#c3c3d5",
  color5  = "#252530",
  color8  = "#e2a478",
  color9  = "#405065",
  color10 = "#0f1117",
  color11 = "#17171b",
  color12 = "#90a0b5",
  color15 = "#bb9dbd",
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
