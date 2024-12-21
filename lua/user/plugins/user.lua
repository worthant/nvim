return {
  {
    "mechatroner/rainbow_csv",
    lazy = false,
  },
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
    end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "vhyrro/luarocks.nvim",
    lazy = false,
    priority = 1001, -- this plugin needs to run before anything else
    opts = {
      rocks = { "magick" },
    },
  },
  {
    "MeanderingProgrammer/markdown.nvim",
    lazy = false,
    name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    config = function()
      require("render-markdown").setup {
        vim.cmd [[
          hi rendermarkdownh1bg guibg=#25293c
          hi rendermarkdownh2bg guibg=#25293c
          hi rendermarkdownh3bg guibg=#25293c
          hi rendermarkdownh4bg guibg=#25293c
          hi rendermarkdownh5bg guibg=#25293c
          hi rendermarkdownh6bg guibg=#25293c
          hi RenderMarkdownCode guibg=#443244 guifg=#dcdcdc
          hi RenderMarkdownCodeBorder guibg=#1c1c1c guifg=#dcdcdc
        ]],
        code = {
          -- Turn on / off code block & inline code rendering
          enabled = true,
          -- Turn on / off any sign column related rendering
          sign = true,
          -- Determines how code blocks & inline code are rendered:
          --  none: disables all rendering
          --  normal: adds highlight group to code blocks & inline code, adds padding to code blocks
          --  language: adds language icon to sign column if enabled and icon + name above code blocks
          --  full: normal + language
          style = "language",
          -- Amount of padding to add to the left of code blocks
          left_pad = 10,
          -- Determins how the top / bottom of code block are rendered:
          --  thick: use the same highlight as the code body
          --  thin: when lines are empty overlay the above & below icons
          border = "thick",
          -- highlight = "RenderMarkdownCode",
        },
        pipe_table = {
          -- Turn on / off pipe table rendering
          enabled = true,
          -- Determines how the table as a whole is rendered:
          --  none: disables all rendering
          --  normal: applies the 'cell' style rendering to each row of the table
          --  full: normal + a top & bottom line that fill out the table when lengths match
          style = "full",
          -- Determines how individual cells of a table are rendered:
          --  overlay: writes completely over the table, removing conceal behavior and highlights
          --  raw: replaces only the '|' characters in each row, leaving the cells unmodified
          --  padded: raw + cells are padded with inline extmarks to make up for any concealed text
          cell = "overlay",
          -- Characters used to replace table border
          -- Correspond to top(3), delimiter(3), bottom(3), vertical, & horizontal
          -- stylua: ignore
          border = {
            '┌', '┬', '┐',
            '├', '┼', '┤',
            '└', '┴', '┘',
            '│', '─',
          },
          -- Highlight for table heading, delimiter, and the line above
          head = "RenderMarkdownTableHead",
          -- Highlight for everything else, main table rows and the line below
          row = "RenderMarkdownTableRow",
          -- Highlight for inline padding used to add back concealed space
          filler = "RenderMarkdownTableFill",
        },
        heading = {
          -- Turn on / off heading icon & background rendering
          enabled = true,
          -- Turn on / off any sign column related rendering
          sign = true,
          -- Replaces '#+' of 'atx_h._marker'
          -- The number of '#' in the heading determines the 'level'
          -- The 'level' is used to index into the array using a cycle
          -- The result is left padded with spaces to hide any additional '#'
          icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
          -- Added to the sign column if enabled
          -- The 'level' is used to index into the array using a cycle
          signs = { "󰫎 " },
          -- The 'level' is used to index into the array using a clamp
          -- Highlight for the heading icon and extends through the entire line
          backgrounds = {
            "rendermarkdownh1bg",
            "rendermarkdownh2bg",
            "rendermarkdownh3bg",
            "rendermarkdownh4bg",
            "rendermarkdownh5bg",
            "rendermarkdownh6bg",
          },
          -- The 'level' is used to index into the array using a clamp
          -- Highlight for the heading and sign icons
          foregrounds = {
            "RenderMarkdownH1",
            "RenderMarkdownH2",
            "RenderMarkdownH3",
            "RenderMarkdownH4",
            "RenderMarkdownH5",
            "RenderMarkdownH6",
          },
        },
      }
    end,
  },
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_quickfix_mode = 0
    end,
  },
  {
    "edluffy/hologram.nvim",
    config = function()
      require("hologram").setup {
        auto_display = true,
      }
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
  {
    "wakatime/vim-wakatime",
    lazy = false,
    setup = function() vim.cmd [[packadd wakatime/vim-wakatime]] end,
  },
  {
    "nfrid/markdown-togglecheck",
    dependencies = { "nfrid/treesitter-utils" },
    ft = { "markdown" },
  },
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup()
      -- refer to `configuration to change defaults`
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      "smoka7/hydra.nvim",
    },
    opts = {},
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
      {
        mode = { "v", "n" },
        "<Leader>mm",
        "<cmd>MCstart<cr>",
        desc = "Create a selection for selected text or word under the cursor",
      },
    },
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
      require("transparent").setup {
        groups = { -- table: default groups
          "Normal",
          "NormalNC",
          "Comment",
          "Constant",
          "Special",
          "Identifier",
          "Statement",
          "PreProc",
          "Type",
          "Underlined",
          "Todo",
          "String",
          "Function",
          "Conditional",
          "Repeat",
          "Operator",
          "Structure",
          "LineNr",
          "NonText",
          "SignColumn",
          "CursorLine",
          "CursorLineNr",
          "StatusLine",
          "StatusLineNC",
          "EndOfBuffer",
        },
        extra_groups = { -- table: additional groups that should be cleared
          "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
          "NvimTreeNormal", -- NvimTree
          "NeoTreeNormal", -- NeoTree
          "NeoTreeNormalNC", -- NeoTree (if you use NeoTree)
        },
        exclude_groups = {}, -- table: groups you don't want to clear
      }
      vim.cmd [[
        highlight Normal guibg=NONE ctermbg=NONE
        highlight NonText guibg=NONE ctermbg=NONE
        highlight LineNr guibg=NONE ctermbg=NONE
        highlight Folded guibg=NONE ctermbg=NONE
        highlight EndOfBuffer guibg=NONE ctermbg=NONE
      ]]
      require("transparent").clear_prefix "NeoTree"
    end,
  },
}
