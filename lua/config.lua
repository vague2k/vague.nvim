local M = {}
---@alias CodeStyle "none"|"italic"|"bold"

---@class VagueConfig.style
---@field comments? CodeStyle
---@field conditionals? CodeStyle
---@field functions? CodeStyle
---@field keywords? CodeStyle
---@field headings? CodeStyle
---@field operators? CodeStyle
---@field keyword_return? CodeStyle
---@field strings? CodeStyle
---@field variables? CodeStyle

---@class VagueConfig
---@field transparent? boolean
---@field style? VagueConfig.style
---@field colors? table
---@field highlights? table

---@type VagueConfig
local DEFAULT_SETTINGS = {
  transparent = false, -- don't set background
  style = {
    -- "none" is the same thing as default. But "italic" and "bold" are also valid options
    comments = "italic",
    conditionals = "none",
    functions = "none",
    keywords = "none",
    headings = "bold", -- markdown headings
    operators = "none",
    keyword_return = "none",
    strings = "italic",
    variables = "none",
  },
  colors = {}, -- Override default colors
  highlights = {}, -- Override highlight groups
}

M._DEFAULT_SETTINGS = DEFAULT_SETTINGS
M.current = M._DEFAULT_SETTINGS

---@param user_opts VagueConfig
M.set = function(user_opts) M.current = vim.tbl_deep_extend("force", vim.deepcopy(M.current), user_opts) end

return M
