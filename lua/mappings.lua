require "nvchad.mappings"

local map = vim.keymap.set

map("t", "jk", "<C-\\><C-n>", { desc = "exit terminal" })
map("n", "<leader>md", "<cmd> MarkdownPreviewToggle <CR>", { desc = "live preview of Markdown"})
--  format with conform
map("n", "<leader>fm", function() require("conform").format() end, { desc = "formatting" })

-- Telescope
map("n", "<leader>fg", "<cmd> Telescope live_grep <CR>", { desc = "Live grep" })
map("n", "<leader>ff", "<cmd> Telescope find_files <CR>", { desc = "Find Files" })
-- Telescope Git
map("n", "<leader>gc", "<cmd> Telescope git_branches <CR>", { desc = "Git Checkout" })
map("n", "<leader>gd", "<cmd> Telescope git_status <CR>", { desc = "Git Diff" })

-- Debug
map("n", "<leader>db", "<cmd> lua require'dap'.toggle_breakpoint() <CR>", { desc = "Toggle Breakpint" })
map("n", "<leader>dd", "<cmd> lua require'dap'.continue() <CR>", { desc = "Start Debugger" })
map("n", "<leader>dn", "<cmd> lua require'dap'.step_over() <CR>", { desc = "Step Over" })
map("n", "<leader>di", "<cmd> lua require'dap'.step_into() <CR>", { desc = "Step Into" })
map("n", "<leader>dr", "<cmd> lua require'dap'.repl.open() <CR>", { desc = "Open REPL" })

map("n", "<leader>dv", "<cmd> DataViewer <CR>", { desc = "Open Data Viewer" })


map("v", ">", ">gv", { desc = "indent" })
map("v", "<", "<gv", { desc = "indent" })

return M
