local internal_conf = require("vague.config.internal")

local function colors()
  local selected = { none = "none" }
  return vim.tbl_extend("force", selected, internal_conf.current.colors or {})
end

return colors()
