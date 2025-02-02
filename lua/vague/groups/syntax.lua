local M = {}

---comment
---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

    -- stylua: ignore
  local hl = {
    Boolean         = { fg = c.number, gui = conf.style.boolean },             -- boolean constants
    Character       = { fg = c.string },                                       -- character constants
    Comment         = { fg = c.comment, gui = conf.style.comments },           -- comments
    Conditional     = { fg = c.keyword, gui = conf.style.conditionals },       -- conditionals
    Constant        = { fg = c.constant },                                     -- (preferred) any constant
    Define          = { fg = c.comment },                                      -- preprocessor '#define'
    Delimiter       = { fg = c.fg },                                           -- delimiter characters
    Error           = { fg = c.error, gui = conf.style.error },                -- (preferred) any erroneous construct
    Exception       = { fg = c.keyword, gui = conf.style.keywords_exception }, -- 'try', 'catch', 'throw'
    Float           = { fg = c.number, gui = conf.style.float },               -- float constants
    Function        = { fg = c.func, gui = conf.style.functions },             -- functions
    Identifier      = { fg = c.constant, gui = conf.style.variables },         -- (preferred) any variable
    Include         = { fg = c.keyword },                                      -- preprocessor '#include'
    Keyword         = { fg = c.keyword, gui = conf.style.keywords },           -- any other keyword
    Label           = { fg = c.keyword, gui = conf.style.keywords_label },     -- 'case', 'default', etc
    Macro           = { fg = c.constant },                                     -- macros
    Number          = { fg = c.number, gui = conf.style.number },              -- number constant
    Operator        = { fg = c.operator, gui = conf.style.operators },         -- '+', '*', 'sizeof' etc
    PreCondit       = { fg = c.comment },                                      -- preprocessor conditionals '#if', '#endif' etc
    PreProc         = { fg = c.constant },                                     -- (preferred) generic preprocessor
    Repeat          = { fg = c.keyword, gui = conf.style.keywords_loop },      -- loop keywords: 'for', 'while' etc
    Special         = { fg = c.builtin },                                      -- (preferred) any special symbol
    SpecialChar     = { fg = c.keyword },                                      -- special character in a constant
    SpecialComment  = { fg = c.keyword },                                      -- special things inside comments
    Statement       = { fg = c.keyword },                                      -- (preferred) any statement
    StorageClass    = { fg = c.constant },                                     -- 'static', 'volatile' etc
    String          = { fg = c.string, gui = conf.style.strings },             -- string constants
    Structure       = { fg = c.constant },                                     -- 'struct', 'union', 'enum' etc
    Tag             = { fg = c.builtin },                                      -- can use <C-]> on this
    Title           = { fg = c.property },
    Todo            = { fg = c.func, gui = conf.style.comments },              -- (preferred) 'TODO' keywords in comments
    Type            = { fg = c.type },                                         -- (preferred) 'int', 'long', 'char' etc
    Typedef         = { fg = c.constant },                                     -- 'typedef'
}

  return hl
end

return M
