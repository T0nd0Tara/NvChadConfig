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

-- Git
map("n", "<leader>go", function()
    local message = vim.fn.input("Enter message: ")
    vim.cmd('! git commit -m "' .. message .. '"')
  end, { desc = "Git Commit"})
map("n", "<leader>ga", function()
    local curr_file = vim.api.nvim_buf_get_name(0)
    vim.cmd('! git add ' .. curr_file)
  end, { desc = "Git Add"})

map("n", "<leader>gA", function()
    -- TODO: 'file_in_path' works only on the first file, fix it with a custom function
    vim.ui.input({ prompt = "Enter Files: ", completion="file_in_path"}, function(files) 
      if files == '' then return end

      files = files or "."
      vim.cmd('! git add ' .. files)
    end)
  end, { desc = "Git Add Multiple Files"})

-- Run
map("n", "<leader>rc", require('runner').run, { desc = "Run Current File"})
map("n", "<leader>ru", require('runner').autorun, { desc = "Run every Update"})
map("n", "<leader>rs", require('runner').autorun_stop, { desc = "Stop Update Run"})

-- Debug
map("n", "<leader>db", "<cmd> lua require'dap'.toggle_breakpoint() <CR>", { desc = "Toggle Breakpint" })
map("n", "<leader>dd", "<cmd> lua require'dap'.continue() <CR>", { desc = "Start Debugger" })
map("n", "<leader>dn", "<cmd> lua require'dap'.step_over() <CR>", { desc = "Step Over" })
map("n", "<leader>di", "<cmd> lua require'dap'.step_into() <CR>", { desc = "Step Into" })
map("n", "<leader>dr", "<cmd> lua require'dap'.repl.open() <CR>", { desc = "Open REPL" })

map("n", "<leader>dv", "<cmd> DataViewer <CR>", { desc = "Open Data Viewer" })


map("v", ">", ">gv", { desc = "indent" })
map("v", "<", "<gv", { desc = "indent" })
