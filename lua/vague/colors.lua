local config = require("vague.config")

local function colors()
  local selected = { none = "none" }
  return vim.tbl_extend("force", selected, config.current.colors or {})
end

return colors()
