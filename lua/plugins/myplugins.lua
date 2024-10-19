local overrides = require "configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  {
    "mg979/vim-visual-multi",
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require 'configs.dap'
    end
  },
  {
    "leoluz/nvim-dap-go",
  },
  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "configs.conform"
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  {
    "sakhnik/nvim-gdb",
    cmd = { "GdbStart", "GdbStartLLDB" },
  },

  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
      require('marks').setup {
         -- whether to map keybinds or not. default true
         default_mappings = true,
         -- which builtin marks to show. default {}
         builtin_marks = { ".", "<", ">", "^" },
         -- whether movements cycle back to the beginning/end of buffer. default true
         cyclic = true,
         -- whether the shada file is updated after modifying uppercase marks. default false
         force_write_shada = false,
         -- how often (in ms) to redraw signs/recompute mark positions. 
         -- higher values will have better performance but may cause visual lag, 
         -- while lower values may cause performance penalties. default 150.
         refresh_interval = 250,
         -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
         -- marks, and bookmarks.
         -- can be either a table with all/none of the keys, or a single number, in which case
         -- the priority applies to all marks.
         -- default 10.
         sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
         -- disables mark tracking for specific filetypes. default {}
         excluded_filetypes = {},
         -- disables mark tracking for specific buftypes. default {}
         excluded_buftypes = {},
         mappings = {}
      }
    end
  },
  {
    'vidocqh/data-viewer.nvim',
    opts = {},
    lazy = false,
    config = {
      autoDisplayWhenOpenFile = false,
      columnColorRoulette = {
        "NormalFloat"
      },
      view = {
        float = true
      }
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kkharji/sqlite.lua", -- Optional, sqlite support
    }
  },
  {
    'VidocqH/lsp-lens.nvim',
    lazy = false,
    config = function()
      local SymbolKind = vim.lsp.protocol.SymbolKind
      require("lsp-lens").setup({
        enable = true,
        include_declaration = false,      -- Reference include declaration
        sections = {                      -- Enable / Disable specific request, formatter example looks 'Format Requests'
          definition = false,
          references = true,
          implements = true,
          git_authors = true,
        },
        ignore_filetype = {
          "prisma",
        },
        -- Target Symbol Kinds to show lens information
        target_symbol_kinds = { SymbolKind.Function, SymbolKind.Method, SymbolKind.Interface },
        -- Symbol Kinds that may have target symbol kinds as children
        wrapper_symbol_kinds = { SymbolKind.Class, SymbolKind.Struct },
      })
    end,
  }
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
