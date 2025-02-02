local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    DiagnosticError               = { fg = c.error, gui = conf.plugins.lsp.diagnostic_error },   -- diagnostic error
    DiagnosticHint                = { fg = c.hint, gui = conf.plugins.lsp.diagnostic_hint},      -- diagnostic hint
    DiagnosticInfo                = { fg = c.constant, gui = conf.plugins.lsp.diagnostic_info }, -- diagnostic info
    DiagnosticUnderlineError      = { gui = "undercurl", sp = c.error },                         -- undercurl for errors
    DiagnosticUnderlineHint       = { gui = "undercurl", sp = c.hint },                          -- undercurl for hints
    DiagnosticUnderlineInfo       = { gui = "undercurl", sp = c.hint },                          -- undercurl for info
    DiagnosticUnderlineWarn       = { gui = "undercurl", sp = c.delta },                         -- undercurl for warnings
    DiagnosticVirtualTextError    = { fg = c.error, gui = conf.plugins.lsp.diagnostic_error },   -- virtual text for errors
    DiagnosticVirtualTextHint     = { fg = c.hint, gui = conf.plugins.lsp.diagnostic_hint},      -- virtual text for hints
    DiagnosticVirtualTextInfo     = { fg = c.delta, gui = conf.plugins.lsp.diagnostic_info },    -- virtual text for info
    DiagnosticVirtualTextWarn     = { fg = c.warning },                                          -- virtual text for warnings
    DiagnosticWarn                = { fg = c.warning, gui = conf.plugins.lsp.diagnostic_warn},   -- diagnostic warning
    LspCodeLens                   = { fg = c.comment, gui = conf.style.comments },               -- code lens text
    LspCodeLensSeparator          = { fg = c.comment },                                          -- code lens separator
    LspCxxHlGroupEnumConstant     = { fg = c.type },                                             -- C++ enum constants
    LspCxxHlGroupMemberVariable   = { fg = c.type },                                             -- C++ member variables
    LspCxxHlGroupNamespace        = { fg = c.func },                                             -- C++ namespaces
    LspCxxHlSkippedRegion         = { fg = c.comment },                                          -- C++ skipped regions
    LspCxxHlSkippedRegionBeginEnd = { fg = c.operator },                                         -- C++ skipped region begin/end
    LspReferenceRead              = { bg = c.comment },                                          -- reference read
    LspReferenceText              = { bg = c.comment },                                          -- reference text
    LspReferenceWrite             = { bg = c.comment },                                          -- reference write
  }

  return hl
end
return M
