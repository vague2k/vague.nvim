local syntax_group = require("vague.groups.syntax")
local ts_group = require("vague.groups.treesitter")
local M = {}

---@param conf VagueColorscheme.InternalConfig
---@return table
M.get_colors = function(conf)
  local syntax = syntax_group.get_colors(conf)
  local treesitter = ts_group.get_colors(conf)

  -- stylua: ignore
  local hl = {
    ["@lsp.type.builtinConstant"]            = treesitter["@constant.builtin"],      -- built-in constants
    ["@lsp.type.builtinType"]                = treesitter["@type.builtin"],          -- built-in types
    ["@lsp.type.class"]                      = syntax["Structure"],                  -- classes
    ["@lsp.type.comment"]                    = syntax["Comment"],                    -- comments
    ["@lsp.type.enum"]                       = syntax["Structure"],                  -- enums
    ["@lsp.type.enumMember"]                 = treesitter["@variable.member"],       -- enum members
    ["@lsp.type.function"]                   = treesitter["@function.call"],         -- functions
    ["@lsp.type.generic"]                    = treesitter["@type"],                  -- generic types
    ["@lsp.type.interface"]                  = syntax["Structure"],                  -- interfaces
    ["@lsp.type.macro"]                      = syntax["Macro"],                      -- macros
    ["@lsp.type.method"]                     = treesitter["@function.method"],       -- methods
    ["@lsp.type.namespace"]                  = treesitter["@module"],                -- namespaces
    ["@lsp.type.parameter"]                  = treesitter["@variable.parameter"],    -- function parameters
    ["@lsp.type.property"]                   = treesitter["@type"],                  -- properties
    ["@lsp.type.selfParameter"]              = syntax["Special"],                    -- self parameters
    ["@lsp.type.typeParameter"]              = syntax["Typedef"],                    -- type parameters
    ["@lsp.type.variable"]                   = treesitter["@constant"],              -- variables
    ["@lsp.typemod.function"]                = treesitter["@function.call"],         -- function calls
    ["@lsp.typemod.function.builtin"]        = treesitter["@function.builtin"],      -- built-in functions
    ["@lsp.typemod.function.defaultLibrary"] = treesitter["@function.builtin"],      -- default library functions
    ["@lsp.typemod.function.definition"]     = treesitter["@function"],              -- function definitions
    ["@lsp.typemod.variable.defaultLibrary"] = treesitter["@constant.builtin"],      -- default library variables
    ["@lsp.typemod.variable.definition"]     = treesitter["@property"],              -- variable definitions
  }

  return hl
end
return M
