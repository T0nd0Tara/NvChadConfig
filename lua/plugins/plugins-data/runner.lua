return {
  'MarcHamamji/runner.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim', 
  },
  config = function()
    require('runner').setup {
      position = 'bottom', -- position of the terminal window when using the shell_handler
      -- can be: top, left, right, bottom
      -- will be overwritten when using the telescope mapping to open horizontally or vertically

      width = 80,         -- width of window when position is left or right
      height = 10,        -- height of window when position is top or bottom

      handlers = {
        python = function(buffer)
          require('runner.handlers.helpers').shell_handler('python3 ' .. vim.fn.expand('%'))(buffer)
        end
      }, -- discussed in https://github.com/MarcHamamji/runner.nvim/tree/main?tab=readme-ov-file#handlers
    }
  end
}
