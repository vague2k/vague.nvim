local c = require("vague.colors")
local config = require("vague.config").current
local M = {}
local hl = { plugins = {} }

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

hl.common = {
  ColorColumn = { bg = c.line },
  Conceal = { fg = c.func, bg = c.bg },
  CurSearch = { fg = c.fg, bg = c.search or c.visual },
  Cursor = { gui = "reverse" },
  vCursor = { gui = "reverse" },
  iCursor = { gui = "reverse" },
  lCursor = { gui = "reverse" },
  CursorIM = { gui = "reverse" },
  CursorColumn = { bg = c.line },
  CursorLine = { bg = c.line },
  CursorLineNr = { fg = c.fg },
  Debug = { fg = c.constant },
  debugPC = { fg = c.bg, bg = c.fg },
  debugBreakpoint = { fg = c.bg, bg = c.operator },
  DiffAdd = { fg = c.plus },
  DiffChange = { fg = c.delta },
  DiffDelete = { fg = c.error },
  DiffText = { fg = c.fg },
  DiffAdded = { fg = c.plus },
  DiffRemoved = { fg = c.error },
  DiffFile = { fg = c.keyword },
  DiffIndexLine = { fg = c.comment },
  Directory = { fg = c.hint },
  ErrorMsg = { fg = c.error, gui = "bold" },
  EndOfBuffer = { c.comment or c.bg },
  FloatBorder = { fg = c.floatBorder, bg = config.transparent and c.none or c.bg },
  FloatTitle = { fg = c.floatBorder, bg = config.transparent and c.none or c.bg },
  FloatFooter = { fg = c.floatBorder, bg = config.transparent and c.none or c.bg },
  Folded = { fg = c.comment, bg = config.transparent and c.none or c.line },
  FoldColumn = { fg = c.comment, bg = config.transparent and c.none or c.bg },
  IncSearch = { fg = c.bg, bg = c.search or c.visual },
  LineNr = { fg = c.comment },
  MatchParen = { fg = c.fg, bg = c.visual },
  MoreMsg = { fg = c.func, gui = "bold" },
  MsgSeparator = { fg = c.string, bg = c.line, gui = "bold" },
  NonText = { fg = c.comment },
  Normal = { fg = c.fg, bg = config.transparent and c.none or c.bg },
  NormalFloat = { fg = c.fg, bg = config.transparent and c.none or c.bg },
  ModeMsg = { fg = c.string },
  Pmenu = { fg = c.fg, bg = c.visual },
  PmenuSbar = { fg = c.none, bg = c.visual },
  PmenuSel = { bg = c.bg },
  PmenuThumb = { fg = c.none, bg = c.visual },
  Question = { fg = c.constant },
  QuickFixLine = { fg = c.func, gui = "underline" },
  Search = { fg = c.fg, bg = c.search or c.visual },
  SignColumn = { fg = c.fg, bg = config.transparent and c.none or c.bg },
  SpecialKey = { fg = c.comment },
  SpellBad = { fg = c.none, gui = "undercurl" },
  SpellCap = { fg = c.none, gui = "undercurl" },
  SpellLocal = { fg = c.none, gui = "undercurl" },
  SpellRare = { fg = c.none, gui = "undercurl" },
  StatusLine = { fg = c.fg, bg = c.comment },
  StatusLineTerm = { fg = c.fg, bg = c.line },
  StatusLineNC = { fg = c.comment, bg = c.bg },
  StatusLineTermNC = { fg = c.comment, bg = c.line },
  Substitute = { fg = c.type, bg = c.visual },
  TabLine = { fg = c.fg, bg = c.line },
  TabLineFill = { fg = c.comment, bg = c.line },
  TabLineSel = { fg = c.bg, bg = c.fg },
  Terminal = { fg = c.fg, bg = config.transparent and c.none or c.bg },
  ToolbarButton = { fg = c.bg, bg = c.visual },
  ToolbarLine = { fg = c.fg },
  Visual = { fg = c.fg, bg = c.visual },
  VisualNOS = { fg = c.none, bg = c.comment, gui = "underline" },
  WarningMsg = { fg = c.warning, gui = "bold" },
  Whitespace = { fg = c.comment },
  WildMenu = { fg = c.bg, bg = c.func },
  WinSeparator = { fg = c.border },
}

hl.syntax = {
  Boolean = { fg = c.number }, -- boolean constants
  Character = { fg = c.string }, -- character constants
  Comment = { fg = c.comment, gui = config.style.comments }, -- comments
  Constant = { fg = c.constant }, -- (preferred) any constant
  Delimiter = { fg = c.fg }, -- delimiter characters
  Float = { fg = c.number }, -- float constants
  Function = { fg = c.func, gui = config.style.functions }, -- functions
  Error = { fg = c.error, gui = "bold" }, -- (preferred) any erroneous construct
  Exception = { fg = c.error }, -- 'try', 'catch', 'throw'
  Identifier = { fg = c.constant, gui = config.style.variables }, -- (preferred) any variable
  Keyword = { fg = c.keyword, gui = config.style.keywords }, -- any other keyword
  Conditional = { fg = c.keyword, gui = config.style.conditionals }, -- conditionals
  -- Repeat = { fg = c.preproc, gui = config.code_style.keywords }, -- loop keywords: 'for', 'while' etc
  -- Label = { fg = c.preproc }, -- 'case', 'default', etc
  Number = { fg = c.number }, -- number constant
  Operator = { fg = c.operator, gui = config.style.operators }, -- '+', '*', 'sizeof' etc
  PreProc = { fg = c.constant }, -- (preferred) generic preprocessor
  -- Define = { fg = c.comment }, -- preprocessor '#define'
  -- Include = { fg = c.keyword, gui = config.code_style.keywords }, -- preprocessor '#include'
  -- Macro = { fg = c.constant, gui = config.code_style.constants }, -- macros
  -- PreCondit = { fg = c.comment }, -- preprocessor conditionals '#if', '#endif' etc
  Special = { fg = c.func }, -- (preferred) any special symbol
  SpecialChar = { fg = c.keyword }, -- special character in a constant
  -- SpecialComment = { fg = c.keyword, gui = config.code_style.comments }, -- special things inside comments
  -- Tag = { fg = c.builtin }, -- can use <C-]> on this
  Statement = { fg = c.keyword }, -- (preferred) any statement
  String = { fg = c.string, gui = config.style.strings }, -- string constants
  Title = { fg = c.property },
  Type = { fg = c.type }, -- (preferred) 'int', 'long', 'char' etc
  -- StorageClass = { fg = c.constant, gui = config.code_style.keywords }, -- 'static', 'volatile' etc
  -- Structure = { fg = c.constant }, -- 'struct', 'union', 'enum' etc
  -- Typedef = { fg = c.constant }, -- 'typedef'
  Todo = { fg = c.func, gui = config.style.comments }, -- (preferred) 'TODO' keywords in comments
}

if vim.api.nvim_call_function("has", { "nvim-0.8" }) == 1 then
  hl.treesitter = {
    -- identifiers
    ["@variable"] = { fg = c.fg, gui = config.style.variables }, -- any variable that does not have another highlight
    ["@variable.builtin"] = hl.syntax["Special"], -- variable names that are defined by the language, like 'this' or 'self'
    ["@variable.member"] = { fg = c.property }, -- fields
    ["@variable.parameter"] = { fg = c.parameter }, -- parameters of a function
    -- ["@variable.field"] = { fg = c.builtin }, -- fields

    -- ["@constant"] = { link = "Constant" }, -- constants
    ["@constant.builtin"] = hl.syntax["Special"], -- constants that are defined by the language, like 'nil' in lua
    -- ["@constant.macro"] = { link = "Macro" }, -- constants that are defined by macros like 'NULL' in c

    -- ["@label"] = { link = "Label" }, -- labels
    ["@module"] = hl.syntax["Type"], -- modules and namespaces

    -- literals
    -- ["@string"] = { link = "String" }, -- strings
    ["@string.documentation"] = hl.syntax["String"] or hl.syntax["Comment"], -- doc strings
    ["@string.regexp"] = hl.syntax["SpecialChar"], -- regex
    ["@string.escape"] = hl.syntax["SpecialChar"], -- escape characters within string
    ["@string.special.symbol"] = hl.syntax["Identifier"],
    -- ["@string.special.url"] = { fg = c.func }, -- urls, links, emails

    -- ["@character"] = { link = "String" }, -- character literals
    -- ["@character.special"] = hl.syntax["SpecialChar"], -- special characters

    -- ["@boolean"] = { link = "Constant" }, -- booleans
    -- ["@number"] = { link = "Number" }, -- all numbers
    -- ["@number.float"] = { link = "Number" }, -- floats

    -- types
    -- ["@type"] = hl.syntax["Type"], -- types
    -- ["@type.builtin"] = hl.syntax["Special"], --builtin types
    -- ["@type.definition"] = hl.syntax["Typedef"], -- typedefs
    -- ["@type.qualifier"]

    ["@attribute"] = hl.syntax["Constant"], -- attributes, like <decorators> in python
    -- ["@property"] = { fg = c.property }, --same as TSField

    -- functions
    -- ["@function"] = { link = "Function" }, -- functions
    ["@function.builtin"] = hl.syntax["Special"], --builtin functions
    -- ["@function.macro"] = { link = "Macro" }, -- macro defined functions
    -- ["@function.call"]
    -- ["@function.method"]
    -- ["@function.method.call"]

    ["@constructor"] = { fg = c.constant, gui = config.style.functions }, -- constructor calls and definitions
    ["@constructor.lua"] = { fg = c.type, gui = config.style.functions }, -- constructor calls and definitions, `= { }` in lua
    ["@operator"] = hl.syntax["Operator"], -- operators, like `+`

    -- keywords
    ["@keyword"] = { fg = c.keyword, gui = config.style.keywords }, -- keywords that don't fall in previous categories
    ["@keyword.exception"] = hl.syntax["Exception"], -- exception related keywords
    ["@keyword.import"] = hl.syntax["PreProc"], -- keywords used to define a function
    ["@keyword.conditional"] = { fg = c.keyword, gui = config.style.conditionals }, -- keywords for conditional statements
    ["@keyword.operator"] = { fg = c.keyword, gui = config.style.operators }, -- keyword operator (eg, 'in' in python)
    ["@keyword.return"] = { fg = c.keyword, gui = config.style.keyword_return }, -- keywords used to define a function
    -- ["@keyword.builtin"] = hl.syntax["Type"], -- keywords used to define a function
    -- ["@keyword.function"] = hl.syntax["Function"], -- keywords used to define a function
    -- ["@keyword.import"] = hl.syntax["Include"], -- includes, like '#include' in c, 'require' in lua
    -- ["@keyword.storage"] = hl.syntax["StorageClass"], -- visibility/life-time 'static'
    -- ["@keyword.repeat"] = hl.syntax["Repeat"], -- for keywords related to loops

    -- punctuation
    ["@punctuation.delimiter"] = { fg = c.fg }, -- delimiters, like `; . , `
    ["@punctuation.bracket"] = { fg = c.fg }, -- brackets and parentheses
    ["@punctuation.special"] = hl.syntax["SpecialChar"], -- punctuation that does not fall into above categories, like `{}` in string interpolation

    -- comment
    -- ["@comment"]
    -- ["@comment.error"]
    -- ["@comment.warning"]
    -- ["@comment.note"]

    -- markup
    ["@markup"] = { fg = c.fg }, -- text in markup language
    ["@markup.strong"] = { fg = c.fg, gui = "bold" }, -- bold
    ["@markup.italic"] = { fg = c.fg, gui = "italic" }, -- italic
    ["@markup.underline"] = { fg = c.fg, gui = "underline" }, -- underline
    ["@markup.strikethrough"] = { fg = c.comment, gui = "strikethrough" }, -- strikethrough
    ["@markup.heading"] = { fg = c.keyword, gui = config.style.headings }, -- markdown titles
    ["@markup.quote.markdown"] = { fg = c.comment }, -- quotes with >
    ["@markup.link.uri"] = { fg = c.string, gui = "underline" }, -- urls, links, emails
    ["@markup.link"] = { fg = c.string }, -- text references, footnotes, citations, etc
    ["@markup.list"] = { fg = c.func },
    ["@markup.list.checked"] = { fg = c.func }, -- todo checked
    ["@markup.list.unchecked"] = { fg = c.func }, -- todo unchecked
    ["@markup.raw"] = { fg = c.func }, -- inline code in markdown
    ["@markup.math"] = { fg = c.string }, -- math environments, like `$$` in latex

    -- diff
    ["@diff.plus"] = { fg = c.plus }, -- added text (diff files)
    ["@diff.minus"] = { fg = c.error }, -- removed text (diff files)
    ["@diff.delta"] = { fg = c.delta }, -- changed text (diff files)

    -- tags
    -- ["@tag"]
    ["@tag.attribute"] = hl.syntax["Identifier"], -- tags, like in html
    ["@tag.delimiter"] = { fg = c.fg }, -- tag delimiter < >
  }

  if vim.api.nvim_call_function("has", { "nvim-0.9" }) == 1 then
    hl.lsp = {
      -- ["@lsp.type.class"] = { link = "Structure" },
      ["@lsp.type.comment"] = hl.syntax["Comment"],
      -- ["@lsp.type.enum"] = { link = "Structure" },
      -- ["@lsp.type.enumMember"] = { link = "Constant" },
      -- ["@lsp.type.interface"] = { link = "Structure" },
      -- ["@lsp.type.typeParameter"] = { link = "Typedef" },
      ["@lsp.type.namespace"] = hl.treesitter["@module"],
      ["@lsp.type.parameter"] = hl.treesitter["@variable.parameter"],
      -- ["@lsp.type.property"] = { link = "Identifier" },
      -- ["@lsp.type.variable"] = hl.treesitter["@variable"],
      -- ["@lsp.type.macro"] = { link = "Macro" },
      -- ["@lsp.type.method"] = { link = "@function.method" },
      -- ["@lsp.type.generic"] = { link = "Type" },
      -- ["@lsp.type.builtinType"] = { link = "Special" },
      ["@lsp.type.selfParameter"] = hl.syntax["Special"],
      ["@lsp.type.builtinConstant"] = hl.syntax["Special"],
      ["@lsp.typemod.method.defaultLibrary"] = hl.syntax["Special"],
      ["@lsp.typemod.function.defaultLibrary"] = hl.syntax["Special"],
      ["@lsp.typemod.function.builtin"] = hl.syntax["Special"],
      ["@lsp.typemod.operator.injected"] = hl.syntax["Operator"],
      ["@lsp.typemod.string.injected"] = hl.syntax["String"],
      ["@lsp.typemod.variable.injected"] = hl.treesitter["@variable"],
      ["@lsp.typemod.variable.defaultLibrary"] = hl.syntax["Special"],
      ["@lsp.typemod.variable.static"] = hl.syntax["Constant"],
      ["@lsp.typemod.variable.global"] = hl.syntax["Constant"],
      ["@lsp.typemod.operator.controlFlow"] = hl.treesitter["@keyword.exception"],
      ["@lsp.typemod.keyword.documentation"] = hl.syntax["Special"],
      ["@lsp.mod.readonly"] = hl.syntax["Constant"],
      ["@lsp.mod.typeHint"] = hl.syntax["Type"],
    }
  end
end

M.setup = function()
  set_vim_highlights(hl.common)
  set_vim_highlights(hl.syntax)
end

return M
