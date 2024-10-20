-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })


vim.cmd [[ source ~/.vimrc ]]

-- loading all of the plugin configs
local configs = vim.api.nvim_get_runtime_file('lua/plugins/plugin-configs/*.lua', true)
if configs ~= nil then
  for _, filename in ipairs(configs) do
    dofile(filename)
  end
else
  vim.print("Error in loading plugin configs")
end

-- dofile('/home/amirs/.config/nvim/lua/plugins/plugin-configs/lsp-lens.lua')
