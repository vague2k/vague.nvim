local config = require("vague.config")
local M = {}

---@param user_opts? VagueConfig
M.setup = function(user_opts)
  if user_opts then config.set(user_opts) end
end

return M
