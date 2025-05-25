local curr_internal_conf = require("vague.config.internal").current
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

  local highlights = {}
  for _, group in pairs(groups) do
    for hl, settings in pairs(group) do
      highlights[hl] = settings
    end
  end

  -- Allow user to add or override any highlight groups
  curr_internal_conf.on_highlights(highlights, curr_internal_conf.colors)
  set_vim_highlights(highlights)
end

return M
