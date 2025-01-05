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
  EndOfBuffer = { fg = c.comment or c.bg },
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
  Pmenu = { fg = c.fg, bg = c.bg },
  PmenuSel = { fg = c.bg, bg = c.keyword },
  PmenuSbar = { fg = c.visual, bg = c.comment },
  PmenuThumb = { fg = c.comment, bg = c.visual },
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
  WinSeparator = { fg = c.floatBorder },
}

hl.syntax = {
  Boolean = { fg = c.number, gui = config.style.boolean }, -- boolean constants
  Character = { fg = c.string }, -- character constants
  Comment = { fg = c.comment, gui = config.style.comments }, -- comments
  Constant = { fg = c.constant }, -- (preferred) any constant
  Delimiter = { fg = c.fg }, -- delimiter characters
  Float = { fg = c.number, gui = config.style.float }, -- float constants
  Function = { fg = c.func, gui = config.style.functions }, -- functions
  Error = { fg = c.error, gui = config.style.error }, -- (preferred) any erroneous construct
  Exception = { fg = c.keyword, gui = config.style.keywords_exception }, -- 'try', 'catch', 'throw'
  Identifier = { fg = c.constant, gui = config.style.variables }, -- (preferred) any variable
  Keyword = { fg = c.keyword, gui = config.style.keywords }, -- any other keyword
  Conditional = { fg = c.keyword, gui = config.style.conditionals }, -- conditionals
  Repeat = { fg = c.keyword, gui = config.style.keywords_loop }, -- loop keywords: 'for', 'while' etc
  Label = { fg = c.keyword, gui = config.style.keywords_label }, -- 'case', 'default', etc
  Number = { fg = c.number, gui = config.style.number }, -- number constant
  Operator = { fg = c.operator, gui = config.style.operators }, -- '+', '*', 'sizeof' etc
  PreProc = { fg = c.constant }, -- (preferred) generic preprocessor
  Define = { fg = c.comment }, -- preprocessor '#define'
  Include = { fg = c.keyword }, -- preprocessor '#include'
  Macro = { fg = c.constant }, -- macros
  PreCondit = { fg = c.comment }, -- preprocessor conditionals '#if', '#endif' etc
  Special = { fg = c.builtin }, -- (preferred) any special symbol
  SpecialChar = { fg = c.keyword }, -- special character in a constant
  SpecialComment = { fg = c.keyword }, -- special things inside comments
  Tag = { fg = c.builtin }, -- can use <C-]> on this
  Statement = { fg = c.keyword }, -- (preferred) any statement
  String = { fg = c.string, gui = config.style.strings }, -- string constants
  Title = { fg = c.property },
  Type = { fg = c.type }, -- (preferred) 'int', 'long', 'char' etc
  StorageClass = { fg = c.constant }, -- 'static', 'volatile' etc
  Structure = { fg = c.constant }, -- 'struct', 'union', 'enum' etc
  Typedef = { fg = c.constant }, -- 'typedef'
  Todo = { fg = c.func, gui = config.style.comments }, -- (preferred) 'TODO' keywords in comments
}

if vim.api.nvim_call_function("has", { "nvim-0.8" }) == 1 then
  hl.treesitter = {
    -- identifiers
    ["@variable"] = { fg = c.fg, gui = config.style.variables }, -- any variable that does not have another highlight
    ["@variable.builtin"] = { fg = c.builtin, gui = config.style.builtin_variables }, -- variable names that are defined by the language, like 'this' or 'self'
    ["@variable.member"] = { fg = c.builtin }, -- fields
    ["@variable.parameter"] = { fg = c.parameter }, -- parameters of a function

    ["@constant"] = hl.syntax["Constant"], -- constants
    ["@constant.builtin"] = { fg = c.number, gui = config.style.builtin_constants }, -- constants that are defined by the language, like 'nil' in lua
    ["@constant.macro"] = hl.syntax["Macro"], -- constants that are defined by macros like 'NULL' in c

    ["@label"] = hl.syntax["Label"], -- labels
    ["@module"] = hl.syntax["Constant"], -- modules and namespaces

    -- literals
    ["@string"] = hl.syntax["String"], -- strings
    ["@string.documentation"] = hl.syntax["Comment"], -- doc strings
    ["@string.regexp"] = hl.syntax["SpecialChar"], -- regex
    ["@string.escape"] = hl.syntax["SpecialChar"], -- escape characters within string
    ["@string.special.symbol"] = hl.syntax["Identifier"],
    ["@string.special.url"] = { fg = c.func }, -- urls, links, emails

    ["@character"] = hl.syntax["String"], -- character literals
    ["@character.special"] = hl.syntax["SpecialChar"], -- special characters

    ["@boolean"] = hl.syntax["Boolean"], -- booleans
    ["@number"] = hl.syntax["Number"], -- all numbers
    ["@number.float"] = hl.syntax["Float"], -- floats

    -- types
    ["@type"] = hl.syntax["Type"], -- types
    ["@type.builtin"] = { fg = c.builtin, gui = config.style.builtin_types }, --builtin types
    ["@type.definition"] = hl.syntax["Typedef"], -- typedefs
    ["@type.declaration"] = { fg = c.constant },

    ["@attribute"] = hl.syntax["Constant"], -- attributes, like <decorators> in python
    ["@property"] = { fg = c.property }, --same as TSField

    -- functions
    ["@function"] = hl.syntax["Function"], -- functions
    ["@function.builtin"] = { fg = c.func, gui = config.style.builtin_functions }, --builtin functions
    ["@function.macro"] = hl.syntax["Macro"], -- macro defined functions
    ["@function.call"] = { fg = c.parameter },
    ["@function.method"] = { fg = c.func },
    ["@function.method.call"] = { fg = c.type },

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

    -- punctuation
    ["@punctuation.delimiter"] = { fg = c.fg }, -- delimiters, like `; . , `
    ["@punctuation.bracket"] = { fg = c.fg }, -- brackets and parentheses
    ["@punctuation.special"] = hl.syntax["SpecialChar"], -- punctuation that does not fall into above categories, like `{}` in string interpolation

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
    ["@markup.raw"] = { fg = c.constant }, -- inline code in markdown
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
      -- If you are seeing this comment, and would like to contribute, specifically to the semantic tokens highlighting,
      -- See the semantic token classification, I find this article very useful
      -- https://code.visualstudio.com/api/language-extensions/semantic-highlight-guide#semantic-token-classification

      -- types
      ["@lsp.type.class"] = hl.syntax["Structure"],
      ["@lsp.type.comment"] = hl.syntax["Comment"],
      ["@lsp.type.enum"] = hl.syntax["Structure"],
      ["@lsp.type.enumMember"] = hl.treesitter["@variable.member"],
      ["@lsp.type.interface"] = hl.syntax["Structure"],
      ["@lsp.type.typeParameter"] = hl.syntax["Typedef"],
      ["@lsp.type.namespace"] = hl.treesitter["@module"],
      ["@lsp.type.parameter"] = hl.treesitter["@variable.parameter"],
      ["@lsp.type.property"] = hl.treesitter["@type"],
      ["@lsp.type.variable"] = hl.treesitter["@constant"],
      ["@lsp.type.macro"] = hl.syntax["Macro"],
      ["@lsp.type.method"] = hl.treesitter["@function.method"],
      ["@lsp.type.function"] = hl.treesitter["@function.call"],
      ["@lsp.type.generic"] = hl.treesitter["@type"],
      ["@lsp.type.builtinType"] = hl.treesitter["@type.builtin"],
      ["@lsp.type.selfParameter"] = hl.syntax["Special"],
      ["@lsp.type.builtinConstant"] = hl.treesitter["@constant.builtin"],

      -- type function modifiers
      ["@lsp.typemod.function"] = hl.treesitter["@function.call"],
      ["@lsp.typemod.function.defaultLibrary"] = hl.treesitter["@function.builtin"],
      ["@lsp.typemod.function.builtin"] = hl.treesitter["@function.builtin"],
      ["@lsp.typemod.function.definition"] = hl.treesitter["@function"],

      -- type variable modifiers
      ["@lsp.typemod.variable.defaultLibrary"] = hl.treesitter["@constant.builtin"],
      ["@lsp.typemod.variable.definition"] = hl.treesitter["@property"],
    }
  end
end

hl.plugins.lsp = {
  LspCxxHlGroupEnumConstant = { fg = c.type },
  LspCxxHlGroupMemberVariable = { fg = c.type },
  LspCxxHlGroupNamespace = { fg = c.func },
  LspCxxHlSkippedRegion = { fg = c.comment },
  LspCxxHlSkippedRegionBeginEnd = { fg = c.operator },
  DiagnosticError = { fg = c.error, gui = "bold" },
  DiagnosticHint = { fg = c.hint },
  DiagnosticInfo = { fg = c.delta, fmt = "italic" },
  DiagnosticWarn = { fg = c.warning },
  DiagnosticVirtualTextError = { bg = c.none, fg = c.error, gui = "bold" },
  DiagnosticVirtualTextWarn = { fg = c.warning },
  DiagnosticVirtualTextInfo = { fg = c.hint },
  DiagnosticVirtualTextHint = { fg = c.hint },
  DiagnosticUnderlineError = { gui = "undercurl", sp = c.error },
  DiagnosticUnderlineWarn = { gui = "undercurl", sp = c.delta },
  DiagnosticUnderlineInfo = { gui = "undercurl", sp = c.hint },
  DiagnosticUnderlineHint = { gui = "undercurl", sp = c.hint },
  LspReferenceText = { bg = c.comment },
  LspReferenceWrite = { bg = c.comment },
  LspReferenceRead = { bg = c.comment },
  LspCodeLens = { fg = c.comment, gui = config.style.comments },
  LspCodeLensSeparator = { fg = c.comment },
}

hl.plugins.cmp = {
  CmpKind = { fg = c.comment },
  CmpGhostText = { fg = c.comment },
  CmpItemAbbr = { fg = c.fg, bg = c.none },
  CmpItemAbbrMatch = { fg = c.keyword },
  CmpItemAbbrMatchFuzzy = { fg = c.keyword },
  CmpItemAbbrDeprecated = { fg = c.error, bg = c.none, strikethrough = true },
  CmpItemMenu = hl.common["Pmenu"],
}

hl.plugins.blink_cmp = {
  BlinkCmpKind = { fg = c.comment },
  BlinkCmpGhostText = { fg = c.comment },
  BlinkCmpLabel = { fg = c.fg, bg = c.none },
  BlinkCmpLabelMatch = { fg = c.keyword },
  BlinkCmpLabelDeprecated = { fg = c.error, bg = c.none, strikethrough = true },
  BlinkCmpMenu = hl.common["Pmenu"],
  BlinkCmpMenuBorder = { fg = c.floatBorder, bg = c.none },
  BlinkCmpDocBorder = { fg = c.floatBorder, bg = c.none },
  BlinkCmpSignatureHelpBorder = { fg = c.floatBorder, bg = c.none },
}

hl.plugins.gitsigns = {
  GitSignsAdd = { fg = c.plus },
  GitSignsAddLn = { fg = c.plus },
  GitSignsAddNr = { fg = c.plus },
  GitSignsChange = { fg = c.delta },
  GitSignsChangeLn = { fg = c.delta },
  GitSignsChangeNr = { fg = c.delta },
  GitSignsDelete = { fg = c.error },
  GitSignsDeleteLn = { fg = c.error },
  GitSignsDeleteNr = { fg = c.error },
}

hl.plugins.neo_tree = {
  NeoTreeNormal = { fg = c.fg, bg = config.transparent and c.none or c.bg },
  NeoTreeNormalNC = { fg = c.fg, bg = config.transparent and c.none or c.bg },
  NeoTreeVertSplit = { fg = c.comment, bg = config.transparent and c.none or c.comment },
  NeoTreeWinSeparator = { fg = c.comment, bg = config.transparent and c.none or c.comment },
  NeoTreeEndOfBuffer = { fg = c.comment, bg = config.transparent and c.none or c.bg },
  NeoTreeRootName = { fg = c.hint, fmt = "bold" },
  NeoTreeGitAdded = { fg = c.plus },
  NeoTreeGitDeleted = { fg = c.error },
  NeoTreeGitModified = { fg = c.delta },
  NeoTreeGitConflict = { fg = c.error, fmt = "bold,italic" },
  NeoTreeGitUntracked = { fg = c.error, fmt = "italic" },
  NeoTreeIndentMarker = { fg = c.comment },
  NeoTreeSymbolicLinkTarget = { fg = c.hint },
}

hl.plugins.telescope = {
  TelescopeBorder = { fg = c.floatBorder },
  TelescopeMatching = { fg = c.delta, gui = "bold" },
  TelescopePromptPrefix = { fg = c.constant },
  TelescopeSelection = { fg = c.constant, bg = c.line },
  TelescopeSelectionCaret = { fg = c.type },
  TelescopeResultsNormal = { fg = c.fg },
}

hl.plugins.dashboard = {
  DashboardShortCut = { fg = c.constant },
  DashboardHeader = { fg = c.keyword },
  DashboardCenter = { fg = c.fg },
  DashboardFooter = { fg = c.parameter, gui = "italic" },
}

hl.plugins.neotest = {
  NeotestTest = { fg = c.fg },
  NeotestUnknown = { fg = c.fg },
  NeotestDir = { fg = c.comment },
  NeotestFile = { fg = c.constant },
  NeotestPassed = { fg = c.plus },
  NeotestFailed = { fg = c.error },
  NeotestMarked = { fg = c.delta },
  NeotestWatching = { fg = c.warning },
  NeotestTarget = { fg = c.func },
  NeotestFocused = { fg = c.hint, gui = "bold" },
  NeotestRunning = { fg = c.hint },
  NeotestAdapterName = { fg = c.func, gui = "bold" },
  NeotestNamespace = { fg = c.parameter },
  NeotestSkipped = { fg = c.warning },
  NeotestIndent = { fg = c.comment },
}

M.set_highlights = function()
  --- set highlights for each group
  set_vim_highlights(hl.common)
  set_vim_highlights(hl.syntax)

  if hl.treesitter then set_vim_highlights(hl.treesitter) end
  if hl.lsp then set_vim_highlights(hl.lsp) end

  for _, group in pairs(hl.plugins) do
    set_vim_highlights(group)
  end
end

return M
