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

local devicons_present, devicons = pcall(require, "nvim-web-devicons")

-- stole it from the ui module of NvChad. as I was unable to use it otherwise for some reason
local file_icon = function()
  local icon = "󰈚"
  local path = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0))
  local name = (path == "" and "Empty") or path:match "([^/\\]+)[/\\]*$"

  if name ~= "Empty" and devicons_present then
    local ft_icon = devicons.get_icon(name)
    icon = (ft_icon ~= nil and ft_icon) or icon
  end

  return icon
end

M.ui = {
  statusline = {
   order = { "mode", "file_path","git", "%=", "lsp_msg", "%=", "lsp", "cwd"},
    modules = {
      clock = "%{strftime('%c')}",
      file_path = function()
        local icon = file_icon()
        return "%#St_file#" .. "%F " .. icon .. " %#St_file_sep#"
      end,
    }
  }
}
-- M.plugins = "plugins"

-- check core.mappings for table structure
-- M.mappings = require "mappings"

return M
