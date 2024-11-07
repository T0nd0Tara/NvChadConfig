return {
  'T0nd0Tara/data-viewer.nvim',
  dir = '~/code/plugins/data-viewer.nvim/',
  dev = true,
  opts = {},
  lazy = false,
  config = {
    modifiable = true,
    autoDisplayWhenOpenFile = false,
    columnColorRoulette = {
      "NormalFloat"
    },
    view = {
      float = true,
      width = 0.5,
      height = 0.5,
      relative = false,
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kkharji/sqlite.lua", -- Optional, sqlite support
  },
}
