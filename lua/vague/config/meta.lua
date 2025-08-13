-- This file defines all the types for the colorscheme's config,
--
-- The reason I'm maintaining 2 seperate files for the same config is to avoid
-- The annoying situation where you go to configure a plugin, and even though
-- You can do this:
--
--          require("plugin").setup({})
--
-- You still get annoying warning messages like:
--
--          ⚠ Missing required fields in type `plugin.Config`: `some_opt`
--
-- Is it more to maintain? yes.
-- Does it increase type safety for both me and you? also yes.
--
-- I'd say it's worth it.

---@alias CodeStyle "none"|"italic"|"bold"

---@class VagueColorscheme.style
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

---@class VagueColorscheme.plugins.cmp
---@field match? CodeStyle -- matching text for cmp plugins
---@field match_fuzzy? CodeStyle -- fuzzy matching text for cmp plugins

---@class VagueColorscheme.plugins.dashboard
---@field footer? CodeStyle

---@class VagueColorscheme.plugins.telescope
---@field match? CodeStyle -- matching text for telescope
---
---@class VagueColorscheme.plugins.neotest
---@field focused? CodeStyle -- style for the current focused test
---@field adapter_name? CodeStyle

---@class VagueColorscheme.plugins.lsp
---@field diagnostic_error? CodeStyle -- lsp diagnostic error text
---@field diagnostic_hint? CodeStyle -- lsp diagnostic hint text
---@field diagnostic_info? CodeStyle -- lsp diagnostic info text
---@field diagnostic_ok? CodeStyle -- lsp diagnostic ok text
---@field diagnostic_warn? CodeStyle -- lsp diagnostic warn text

---@class VagueColorscheme.plugins
---@field cmp? VagueColorscheme.plugins.cmp
---@field telescope? VagueColorscheme.plugins.telescope
---@field dashboard? VagueColorscheme.plugins.telescope
---@field lsp? VagueColorscheme.plugins.telescope

---@class VagueColorscheme.colors
---@field bg? string
---@field inactiveBg? string
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

---@class VagueColorscheme.Config
---@field transparent? boolean
---@field bold? boolean
---@field italic? boolean
---@field style? VagueColorscheme.style
---@field colors? VagueColorscheme.colors
---@field plugins? VagueColorscheme.plugins
---@field on_highlights? fun(highlights: table<string, vim.api.keyset.highlight>, colors: VagueColorscheme.InternalConfig.colors)

---@type VagueColorscheme.Config | fun():VagueColorscheme.Config | nil
vim.g.vague_colorscheme = vim.g.vague_colorscheme
