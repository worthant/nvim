return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "wakatime/vim-wakatime",
    lazy=false,
    setup = function ()
      vim.cmd([[packadd wakatime/vim-wakatime]])
    end
  },
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
          {
          name = "ayu",
          light = "ayu_light",
          dark = "ayu_mirage",
          },
          {
            name = "gruvbox",
            light = "gruvbox_light",
            dark = "gruvbox_dark",
          },
          {
            name = "tokyonight",
            light = "tokyonight_light",
            dark = "tokyonight_storm",
          },
          {
            name = "nord",
            light = "nord_light",
            dark = "nord_night",
          },
          {
            name = "nightfox",
            light = "nightfox_light",
            dark = "nightfox_dark",
          },
          {
            name = "rose-pine",
            light = "rose-pine_dawn",
            dark = "rose-pine_moon",
          },
          {
            name = "catppuccino",
            light = "catppuccino_light",
            dark = "catppuccino_dark",
          },
          {
            name = "kanagawa",
            light = "kanagawa_light",
            dark = "kanagawa_dark",
          },
        },
        themeConfigFile = "~/.config/nvim/lua/user/theme.lua",
        livePreview = true,
        --[[
        themes = {"onedark", "ayu", "gruvbox", "tokyonight", "nord", "nightfox", "rose-pine", "catppuccino", "kanagawa"},
        styles = {
          italic = true,
          bold = true,
        },
        ]]--
      })
    end,
  }
}
