return {
  "anurag3301/nvim-platformio.lua",
  dependencies = {
    { "akinsho/nvim-toggleterm.lua" },
    { "nvim-telescope/telescope.nvim" },
    { "nvim-lua/plenary.nvim" },
  },
  -- Ленивая загрузка - плагин будет загружен только при использовании команд
  cmd = {
    "Pioinit",
    "Piorun",
    "Piocmd",
    "Piolib",
    "Piomon",
    "Piodebug",
    "Piodb",
  },
  config = function()
    require("platformio").setup {
      lsp = "clangd",
    }
  end,
}
