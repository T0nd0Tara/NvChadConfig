---@type MappingsTable
local M = {}

M.general = {
  t = {
    ["jk"] = { "<C-\\><C-n>", "exit terminal"},
  },
  n = {
    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
    ["<leader>h"] = { "<cmd> NvCheatsheet <CR>", "Open NvCheatsheet"},
    ["<leader>gr"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    -- Debug
    ["<leader>b"] = { "<cmd>a lua require'dap'.toggle_breakpoint() <CR>", "Toggle Breakpint"},
    ["<leader>d"] = { "<cmd> lua require'dap'.continue() <CR>", "Start Debugger"},
    ["<C-d-n>"] = { "<cmd> lua require'dap'.step_over() <CR>", "Step Over"},
    ["<C-d-i>"] = { "<cmd> lua require'dap'.step_into() <CR>", "Step Over"},
    ["<C-d>r"] = { "<cmd> lua require'dap'.repl.open() <CR>", "Step Over"},
  },

  v = {
    [">"] = { ">gv", "indent"},
  }
}
-- more keybinds!

return M
