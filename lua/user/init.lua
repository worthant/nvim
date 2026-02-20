return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "catppuccin",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = false, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      "clangd",
      "tailwindcss",
      "lemminx",
      "ruff_lsp",
      "texlab",
      "prolog_ls",
      "kotlin_language_server",
    },
    config = {
      kotlin_language_server = {},
      prolog_ls = {
        cmd = { "swipl", "-g", "prolog_language_server" },
        filetypes = { "prolog" },
        root_dir = function(fname) return require("lspconfig.util").find_git_ancestor(fname) or vim.fn.getcwd() end,
      },
      ruff_lsp = {
        filetypes = { "python" },
        root_dir = function(fname) return require("lspconfig.util").find_git_ancestor(fname) or vim.fn.getcwd() end,
      },
      clangd = {
        cmd = {
          "clangd",
          "--fallback-style=none",
          "--offset-encoding=utf-16",
          "--compile-commands-dir=.pio/build/esp32-s3-devkitc-1",
        },
        autostart = true,
        filetypes = { "c", "cpp", "objc", "objcpp" },
      },
      tailwindcss = {
        filetypes = { "html", "javascriptreact", "typescriptreact", "css", "scss" },
      },
      texlab = {
        settings = {
          texlab = {
            build = {
              executable = "latexmk",
              args = {
                "-pdf",
                "-interaction=nonstopmode",
                "-synctex=1",
                "-r",
                "/home/boris/.config/nvim/.latexmkrc",
                "%f",
              },
              onSave = true,
            },
            forwardSearch = {
              executable = "evince",
              args = { "--unique", "file:%p#src:%l%f" },
            },
            chktex = {
              onEdit = true,
              onOpenAndSave = true,
            },
          },
        },
        on_attach = function(bufnr)
          -- Add autoformat on save if enabled
          if
            require("config").lsp.formatting.format_on_save.enabled
            and vim.tbl_contains(require("config").lsp.formatting.format_on_save.allow_filetypes, "tex")
          then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function() vim.lsp.buf.format { bufnr = bufnr } end,
            })
          end
        end,
      },
      lemminx = {
        filetypes = { "xml", "xsd", "xslt", "svg", "ant" },
        init_options = {
          javaRuntime = "/usr/bin/java",
          -- Enable document links
          documentLinks = {
            enabled = true,
          },
          -- Enable diagnostics
          diagnostics = {
            enabled = true,
          },
          -- Enable code actions
          codeActions = {
            enabled = true,
          },
          -- Enable document formatting
          format = {
            enabled = true,
          },
          -- Enable document symbols
          symbols = {
            enabled = true,
          },
        },
        settings = {
          xml = {
            -- Enable XML validation
            validation = {
              enabled = true,
            },
            -- Enable XML formatting
            format = {
              enabled = true,
              splitAttributes = false,
              joinCDATALines = false,
              formatComments = true,
              joinContentLines = false,
              spaceBeforeEmptyCloseTag = true,
              preserveEmptyContent = true,
              maxLineWidth = 120,
              indentSize = 4,
              insertSpaces = false,
              spaceBeforeEquals = true,
              spaceAfterEquals = true,
            },
            -- Enable XML completion
            completion = {
              autoCloseTags = true,
              autoCloseRemovesContent = true,
              triggerCharacters = { "<", '"', "'" },
            },
            -- Enable XML hover information
            hover = {
              documentation = true,
              references = true,
            },
            -- Enable XML code lens
            codeLens = {
              enabled = true,
            },
            -- Enable XML document symbols
            symbols = {
              enabled = true,
              excluded = {},
            },
            -- Enable XML document links
            documentLink = {
              enabled = true,
            },
            -- Enable XML rename
            rename = {
              enabled = true,
            },
          },
        },
      },
    },
  },
  {
    "edluffy/hologram.nvim",
    config = function()
      require("hologram").setup {
        auto_display = true,
      }
    end,
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "c", "cpp" },
      callback = function()
        vim.lsp.start {
          name = "clangd",
          cmd = { "/home/boris/.local/share/nvim/mason/bin/clangd", "--offset-encoding=utf-16" },
          root_dir = vim.fs.dirname(vim.fs.find({ "compile_commands.json", "platformio.ini" }, { upward = true })[1]),
        }
      end,
    })
  end,
}
