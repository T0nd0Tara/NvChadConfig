-- Path to overriding theme and highlights files
local highlights = require "highlights"
-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "bearded-arc",
  theme_toggle = { "bearded-arc", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

-- M.plugins = "plugins"

-- check core.mappings for table structure
-- M.mappings = require "mappings"

return M
