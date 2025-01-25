local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local c = conf.colors

  -- stylua: ignore
  local hl = {
    NeotestTest             = { fg = c.fg },                 -- Test status
    NeotestUnknown          = { fg = c.fg },                 -- Unknown test status
    NeotestDir              = { fg = c.comment },            -- Directory for tests
    NeotestFile             = { fg = c.constant },           -- Test file
    NeotestPassed           = { fg = c.plus },               -- Passed tests
    NeotestFailed           = { fg = c.error },              -- Failed tests
    NeotestMarked           = { fg = c.delta },              -- Marked tests
    NeotestWatching         = { fg = c.warning },            -- Watching status for tests
    NeotestTarget           = { fg = c.func },               -- Target test
    NeotestFocused          = { fg = c.hint, gui = "bold" }, -- Focused test
    NeotestRunning          = { fg = c.hint },               -- Running tests
    NeotestAdapterName      = { fg = c.func, gui = "bold" }, -- Adapter name in tests
    NeotestNamespace        = { fg = c.parameter },          -- Namespace for tests
    NeotestSkipped          = { fg = c.warning },            -- Skipped tests
    NeotestIndent           = { fg = c.comment },            -- Indentation for tests
  }

  return hl
end
return M
