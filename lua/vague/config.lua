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

---@class VagueConfig.colors
---@field bg? string
---@field fg? string
---@field floatBorder? string
---@field line? string
---@field comment? string
---@field builtin? string
---@field func? string
---@field string? string
---@field number? string
---@field property? string
---@field constant? string
---@field parameter? string
---@field visual? string
---@field error? string
---@field warning? string
---@field hint? string
---@field operator? string
---@field keyword? string
---@field type? string
---@field search? string
---@field plus? string
---@field delta? string

---@class VagueConfig
---@field transparent? boolean
---@field style? VagueConfig.style
---@field colors? VagueConfig.colors
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
  -- Override colors
  colors = {
    bg = "#18191a",
    fg = "#cdcdcd",
    floatBorder = "#878787",
    line = "#282830",
    comment = "#646477",
    builtin = "#be8c8c",
    func = "#be8c8c",
    string = "#d7b797",
    number = "#d2a374",
    property = "#b4b4ce",
    constant = "#b4b4ce",
    parameter = "#b9a3ba",
    visual = "#363738",
    error = "#e6788c",
    warning = "#e6be8c",
    hint = "#8ca0dc",
    operator = "#96a3b2",
    keyword = "#7894ab",
    type = "#a1b3b9",
    search = "#465362",
    plus = "#a3cd81",
    delta = "#e6be8c",
  },
  -- Override highlight groups
  highlights = {},
}

M._DEFAULT_SETTINGS = DEFAULT_SETTINGS
M.current = M._DEFAULT_SETTINGS

---@param user_opts VagueConfig
M.set = function(user_opts) M.current = vim.tbl_deep_extend("force", vim.deepcopy(M.current), user_opts) end

return M
