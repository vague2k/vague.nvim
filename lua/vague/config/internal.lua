local M = {}

---@class VagueColorscheme.InternalConfig
local DEFAULT_SETTINGS = {

  ---@type boolean
  transparent = false,
  ---@class VagueColorscheme.InternalConfig.style
  style = {
    ---@type string
    boolean = "none",
    ---@type string
    number = "none",
    ---@type string
    float = "none",
    ---@type string
    error = "none",
    ---@type string
    comments = "italic",
    ---@type string
    conditionals = "none",
    ---@type string
    functions = "none",
    ---@type string
    headings = "bold",
    ---@type string
    operators = "none",
    ---@type string
    strings = "italic",
    ---@type string
    variables = "none",

    ---@type string
    keywords = "none",
    ---@type string
    keyword_return = "none",
    ---@type string
    keywords_loop = "none",
    ---@type string
    keywords_label = "none",
    ---@type string
    keywords_exception = "none",

    builtin_constants = "none",
    ---@type string
    builtin_functions = "none",
    ---@type string
    builtin_types = "none",
    ---@type string
    builtin_variables = "none",
  },
  ---@class VagueColorscheme.InternalConfig.colors
  colors = {
    ---@type string
    bg = "#151516",
    ---@type string
    fg = "#cdcdcd",
    ---@type string
    floatBorder = "#878787",
    ---@type string
    line = "#252530",
    ---@type string
    comment = "#606079",
    ---@type string
    builtin = "#b4d4cf",
    ---@type string
    func = "#c48282",
    ---@type string
    string = "#e8b589",
    ---@type string
    number = "#e0a363",
    ---@type string
    property = "#c3c3d5",
    ---@type string
    constant = "#aeaed1",
    ---@type string
    parameter = "#bb9dbd",
    ---@type string
    visual = "#333738",
    ---@type string
    error = "#df6882",
    ---@type string
    warning = "#f3be7c",
    ---@type string
    hint = "#7e98e8",
    ---@type string
    operator = "#90a0b5",
    ---@type string
    keyword = "#6e94b2",
    ---@type string
    type = "#9bb4bc",
    ---@type string
    search = "#405065",
    ---@type string
    plus = "#8cb66d",
    ---@type string
    delta = "#f3be7c",
  },
}

M._DEFAULT_SETTINGS = DEFAULT_SETTINGS
M.current = M._DEFAULT_SETTINGS

local opts = type(vim.g.vague_colorscheme) == "function" and vim.g.vague_colorscheme() or vim.g.vague_colorscheme or {}

---@param user_opts VagueColorscheme.Config
M.set = function(user_opts) M.current = vim.tbl_deep_extend("force", vim.deepcopy(M.current), user_opts or opts) end

return M
