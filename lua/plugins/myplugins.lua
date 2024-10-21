local overrides = require "configs.overrides"

local add_plugin = function (name)
  return require("plugins.plugins-data." .. name)
end

---@type NvPluginSpec[]
local plugins = {
  { "mg979/vim-visual-multi" },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require 'configs.dap'
    end
  },
  { "leoluz/nvim-dap-go" },
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
  add_plugin('markdown-preview'),
  add_plugin('marks'),
  add_plugin('data-viewer'),
  add_plugin('lsp-lens'),
}


return plugins
