local M = {}
---@alias CodeStyle "none"|"italic"|"bold"

---@class VagueConfig.style
---@field boolean? CodeStyle
---@field number? CodeStyle -- number constants
---@field float? CodeStyle -- floating point numbers
---@field error? CodeStyle -- any erroneous construct
---@field comments? CodeStyle
---@field conditionals? CodeStyle
---@field functions? CodeStyle -- function name
---@field headings? CodeStyle -- markdown headings
---@field operators? CodeStyle -- like "+"
---@field strings? CodeStyle
---@field variables? CodeStyle
---@field keywords? CodeStyle
---@field keyword_return? CodeStyle
---@field keywords_loop? CodeStyle -- "for", "while", etc
---@field keywords_label? CodeStyle -- "default", "case", etc
---@field keywords_exception? CodeStyle -- "try", "catch", etc
---@field builtin_constants? CodeStyle -- like "nil" in lua and golang
---@field builtin_functions? CodeStyle -- like "nil" in lua and golang
---@field builtin_types? CodeStyle -- like "nil" in lua and golang
---@field builtin_variables? CodeStyle -- like "this", "self"

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

---@type VagueConfig
local DEFAULT_SETTINGS = {
  transparent = false, -- don't set background
  style = {
    -- "none" is the same thing as default. But "italic" and "bold" are also valid options
    boolean = "none",
    number = "none",
    float = "none",
    error = "none",
    comments = "italic",
    conditionals = "none",
    functions = "none",
    headings = "bold",
    operators = "none",
    strings = "italic",
    variables = "none",

    -- keywords
    keywords = "none",
    keyword_return = "none",
    keywords_loop = "none",
    keywords_label = "none",
    keywords_exception = "none",

    -- builtin
    builtin_constants = "none",
    builtin_functions = "none",
    builtin_types = "none",
    builtin_variables = "none",
  },
  -- Override colors
  colors = {
    bg = "#18191a",
    fg = "#cdcdcd",
    floatBorder = "#878787",
    line = "#282830",
    comment = "#646477",
    builtin = "#bad1ce",
    func = "#be8c8c",
    string = "#deb896",
    number = "#d2a374",
    property = "#c7c7d4",
    constant = "#b4b4ce",
    parameter = "#b9a3ba",
    visual = "#363738",
    error = "#d2788c",
    warning = "#e6be8c",
    hint = "#8ca0dc",
    operator = "#96a3b2",
    keyword = "#7894ab",
    type = "#a1b3b9",
    search = "#465362",
    plus = "#8faf77",
    delta = "#e6be8c",
  },
}

M._DEFAULT_SETTINGS = DEFAULT_SETTINGS
M.current = M._DEFAULT_SETTINGS

---@param user_opts VagueConfig
M.set = function(user_opts) M.current = vim.tbl_deep_extend("force", vim.deepcopy(M.current), user_opts) end

return M
