-- Path to overriding theme and highlights files
local highlights = require "highlights"
-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "bearded-arc",
  theme_toggle = { "bearded-arc", "tokyonight" },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

-- stole it from the ui module of NvChad. as I was unable to use it otherwise for some reason
local file_info = function()
  local icon = "󰈚"
  local path = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0))
  local name = (path == "" and "Empty") or path:match "([^/\\]+)[/\\]*$"

  if name ~= "Empty" then
    local devicons_present, devicons = pcall(require, "nvim-web-devicons")

    if devicons_present then
      local ft_icon = devicons.get_icon(name)
      icon = (ft_icon ~= nil and ft_icon) or icon
    end
  end

  return { icon, path }
end

M.ui = {
  statusline = {
   order = { "mode", "file","git", "%=", "lsp_msg", "clock", "%=", "lsp", "cwd" },
    modules = {
      clock = "%{strftime('%c')}",
      file_path = function()
        local file_logo, path = file_info()
        return "%#StText#" .. file_logo .. "%F"
      end,
    }
  }
}
-- M.plugins = "plugins"

-- check core.mappings for table structure
-- M.mappings = require "mappings"

return M
