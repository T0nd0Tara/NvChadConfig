require "nvchad.mappings"

local map = vim.keymap.set

map("t", "jk", "<C-\\><C-n>", { desc = "exit terminal" })

--  format with conform
map("n", "<leader>fm", function() require("conform").format() end, { desc = "formatting" })

map("n", "<leader>h", "<cmd> NvCheatsheet <CR>", { desc = "Open NvCheatsheet"})
map("n", "<leader>gr", "<cmd> Telescope live_grep <CR>", { desc = "Live grep" })
-- Debug
map("n", "<leader>b", "<cmd>a lua require'dap'.toggle_breakpoint() <CR>", { desc = "Toggle Breakpint"})
map("n", "<leader>d", "<cmd> lua require'dap'.continue() <CR>", { desc = "Start Debugger"})
map("n", "<C-d-n>", "<cmd> lua require'dap'.step_over() <CR>", { desc = "Step Over"})
map("n", "<C-d-i>", "<cmd> lua require'dap'.step_into() <CR>", { desc = "Step Over"})
map("n", "<C-d>r", "<cmd> lua require'dap'.repl.open() <CR>", { desc = "Step Over"})

map("v", ">", ">gv", { desc = "indent"})

return M
