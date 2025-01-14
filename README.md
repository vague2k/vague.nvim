![vague-banner](https://github.com/user-attachments/assets/788de8f0-a397-448b-bdf3-4881e2f5e979)

vague is a cool, dark, low contrast theme inspired by [ThePrimeagen](https://github.com/ThePrimeagen)'s use of [rose-pine](https://github.com/rose-pine/neovim) without fixing [tmux](https://github.com/tmux/tmux)'s colors.

### Below is a preview/comparison of the theme
![vague](https://github.com/user-attachments/assets/58042519-07c9-44ff-9f42-a40c26f64831)
![prime](https://github.com/user-attachments/assets/48a02ad7-3679-4214-89dd-1d7803a878db)

## Installation

```lua
-- Lazy
{
  "vague2k/vague.nvim",
  config = function()
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
    boolean = "none",
    number = "none",
    float = "none",
    error = "none",
    comments = "italic",
    conditionals = "none",
    functions = "none",
    headings = "bold",
    operators = "none",
    strings = "italic",
    variables = "none",

    -- keywords
    keywords = "none",
    keyword_return = "none",
    keywords_loop = "none",
    keywords_label = "none",
    keywords_exception = "none",

    -- builtin
    builtin_constants = "none",
    builtin_functions = "none",
    builtin_types = "none",
    builtin_variables = "none",
  },
  -- Override colors
  colors = {
    bg = "#18191a",
    fg = "#cdcdcd",
    floatBorder = "#878787",
    line = "#282830",
    comment = "#646477",
    builtin = "#bad1ce",
    func = "#be8c8c",
    string = "#deb896",
    number = "#d2a374",
    property = "#c7c7d4",
    constant = "#b4b4ce",
    parameter = "#b9a3ba",
    visual = "#363738",
    error = "#d2788c",
    warning = "#e6be8c",
    hint = "#8ca0dc",
    operator = "#96a3b2",
    keyword = "#7894ab",
    type = "#a1b3b9",
    search = "#465362",
    plus = "#8faf77",
    delta = "#e6be8c",
  },
})
```

## Acknowledgements

The structure of this code was shamelessly ripped off [neomodern](https://github.com/cdmill/neomodern.nvim) of which I used it's roseprime colorscheme for a very long time. I'd highly suggest you check it out.

## Contributing

PR's are welcome and encouraged.

If you would like to propose support for a specific plugin, you can make a PR with your modifications to [this file](https://github.com/vague2k/vague.nvim/blob/main/lua/vague/highlights.lua)

## Supported plugins

- [cmp](https://github.com/hrsh7th/nvim-cmp)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [Dashboard](https://github.com/nvimdev/dashboard-nvim)
- [Neotest](https://github.com/nvim-neotest/neotest)
