<img width="1582" alt="Screenshot 2025-05-24 at 1 44 17 PM" src="https://github.com/user-attachments/assets/8145d76e-3040-4bee-b6bf-3c65140f4786" />

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "vague2k/vague.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other plugins
  config = function()
    -- NOTE: you do not need to call setup if you don't want to.
    require("vague").setup({
      -- optional configuration here
    })
    vim.cmd("colorscheme vague")
  end
},
```

Using Neovim 0.12 built-in plugin manager `vim.pack`:

```lua
vim.pack.add({
  "https://github.com/vague2k/vague.nvim",
})

require("vague").setup({
    -- optional configuration here
})

vim.cmd("colorscheme vague")
```

## Default configuration

```lua
require("vague").setup({
  transparent = false, -- don't set background
  -- disable bold/italic globally in `style`
  bold = true,
  italic = true,
  style = {
    -- "none" is the same thing as default. But "italic" and "bold" are also valid options
    boolean = "bold",
    number = "none",
    float = "none",
    error = "bold",
    comments = "italic",
    conditionals = "none",
    functions = "none",
    headings = "bold",
    operators = "none",
    strings = "italic",
    variables = "none",

    -- keywords
    keywords = "none",
    keyword_return = "italic",
    keywords_loop = "none",
    keywords_label = "none",
    keywords_exception = "none",

    -- builtin
    builtin_constants = "bold",
    builtin_functions = "none",
    builtin_types = "bold",
    builtin_variables = "none",
  },
  -- plugin styles where applicable
  -- make an issue/pr if you'd like to see more styling options!
  plugins = {
    cmp = {
      match = "bold",
      match_fuzzy = "bold",
    },
    dashboard = {
      footer = "italic",
    },
    lsp = {
      diagnostic_error = "bold",
      diagnostic_hint = "none",
      diagnostic_info = "italic",
      diagnostic_ok = "none",
      diagnostic_warn = "bold",
    },
    neotest = {
      focused = "bold",
      adapter_name = "bold",
    },
    telescope = {
      match = "bold",
    },
  },

  -- Override highlights or add new highlights
  on_highlights = function(highlights, colors) end,

  -- Override colors
  colors = {
    bg = "#141415",
    inactiveBg = "#1c1c24",
    fg = "#cdcdcd",
    floatBorder = "#878787",
    line = "#252530",
    comment = "#606079",
    builtin = "#b4d4cf",
    func = "#c48282",
    string = "#e8b589",
    number = "#e0a363",
    property = "#c3c3d5",
    constant = "#aeaed1",
    parameter = "#bb9dbd",
    visual = "#333738",
    error = "#d8647e",
    warning = "#f3be7c",
    hint = "#7e98e8",
    operator = "#90a0b5",
    keyword = "#6e94b2",
    type = "#9bb4bc",
    search = "#405065",
    plus = "#7fa563",
    delta = "#f3be7c",
  },
})
```

## Explicitly Supported plugins

- [Blink-cmp](https://github.com/Saghen/blink.cmp)
- [Cmp](https://github.com/hrsh7th/nvim-cmp)
- [Dashboard](https://github.com/nvimdev/dashboard-nvim)
- [Diffview](https://github.com/sindrets/diffview.nvim)
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [Lualine](https://github.com/nvim-lualine/lualine.nvim)
- [Neotest](https://github.com/nvim-neotest/neotest)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)
- [Snacks](https://github.com/folke/snacks.nvim)
- [Rainbow delimiters](https://github.com/hiphish/rainbow-delimiters.nvim)
- [Mini](https://github.com/echasnovski/mini.nvim)
- [Vim-better-whitespace](https://github.com/ntpeters/vim-better-whitespace)

## Extras

Extra color configs for other tools can be found in [extras](extras/).

## Contributing

PR's are welcome and encouraged.

If you would like to propose support for a specific plugin, you can make a PR with your modifications to the `lua/vague/groups` directory
