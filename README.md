![vague-banner](https://github.com/user-attachments/assets/788de8f0-a397-448b-bdf3-4881e2f5e979)

<img width="1582" alt="theme" src="https://github.com/user-attachments/assets/4424408e-812c-4976-a28b-f3e592e9514d" />

vague is a cool, dark, low contrast theme inspired by [ThePrimeagen](https://github.com/ThePrimeagen)'s use of [rose-pine](https://github.com/rose-pine/neovim) without fixing [tmux](https://github.com/tmux/tmux)'s colors.

## Installation

```lua
-- Lazy
{
  "vague2k/vague.nvim",
  config = function()
    -- NOTE: you do not need to call setup if you don't want to.
    require("vague").setup({
      -- optional configuration here
    })
  end
},
```

## Default configuration

```lua
require("vague").setup({
  transparent = false, -- don't set background
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
  -- Override colors
  colors = {
    bg = "#141415",
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
    error = "#df6882",
    warning = "#f3be7c",
    hint = "#7e98e8",
    operator = "#90a0b5",
    keyword = "#6e94b2",
    type = "#9bb4bc",
    search = "#405065",
    plus = "#8cb66d",
    delta = "#f3be7c",
  },
})
```

## Explicitly Supported plugins

- [Blink](https://github.com/Saghen/blink.cmp)
- [Cmp](https://github.com/hrsh7th/nvim-cmp)
- [Dashboard](https://github.com/nvimdev/dashboard-nvim)
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [Lualine](https://github.com/nvim-lualine/lualine.nvim)
- [Neotest](https://github.com/nvim-neotest/neotest)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

## Contributing

PR's are welcome and encouraged.

If you would like to propose support for a specific plugin, you can make a PR with your modifications to the `lua/vague/groups` directory
