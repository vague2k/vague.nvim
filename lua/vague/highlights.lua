local groups = require("vague.groups")
local M = {}

---@param highlights table <string, table>
local function set_vim_highlights(highlights)
  for name, setting in pairs(highlights) do
    vim.api.nvim_command(
      string.format(
        "highlight %s guifg=%s guibg=%s guisp=%s gui=%s",
        name,
        setting.fg or "none",
        setting.bg or "none",
        setting.sp or "none",
        setting.gui or "none"
      )
    )
  end
end

M.set_highlights = function()
  if groups.treesitter and vim.api.nvim_call_function("has", { "nvim-0.8" }) == 1 then
    set_vim_highlights(groups.treesitter)
  end
  if groups.lsp_native and vim.api.nvim_call_function("has", { "nvim-0.9" }) == 1 then
    set_vim_highlights(groups.lsp_native)
  end
  for _, group in pairs(groups) do
    set_vim_highlights(group)
  end
end

return M
