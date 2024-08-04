return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier.with {
        filetypes = { "markdown", "json", "xml", "yaml", "html", "css", "javascript", "typescript" },
        extra_args = { "--prose-wrap=always", "--use-tabs", "--single-quote" },
      },
      null_ls.builtins.formatting.black.with {
        filetypes = { "python" },
      },
      null_ls.builtins.diagnostics.ruff.with {
        filetypes = { "python" },
        command = "/home/boris/.local/share/nvim/mason/bin/ruff",
      },
      null_ls.builtins.formatting.latexindent.with {
        filetypes = { "tex" },
      },
    }
    return config -- return final config table
  end,
}
