require('dap-go').setup {
  -- Additional dap configurations can be added.
  -- dap_configurations accepts a list of tables where each entry
  -- represents a dap configuration. For more details do:
  -- :help dap-configuration
  dap_configurations = {
    {
      -- Must be "go" or it will be ignored by the plugin
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
    },
  },
  -- delve configurations
  delve = {
    -- the path to the executable dlv which will be used for debugging.
    -- by default, this is the "dlv" executable on your PATH.
    path = "dlv",
    -- time to wait for delve to initialize the debug session.
    -- default to 20 seconds
    initialize_timeout_sec = 20,
    -- a string that defines the port to start delve debugger.
    -- default to string "${port}" which instructs nvim-dap
    -- to start the process in a random available port
    port = "${port}",
    -- additional args to pass to dlv
    args = {},
    -- the build flags that are passed to delve.
    -- defaults to empty string, but can be used to provide flags
    -- such as "-tags=unit" to make sure the test suite is
    -- compiled during debugging, for example.
    -- passing build flags using args is ineffective, as those are
    -- ignored by delve in dap mode.
    build_flags = "",
    -- whether the dlv process to be created detached or not. there is
    -- an issue on Windows where this needs to be set to false
    -- otherwise the dlv server creation will fail.
    detached = true
  },
}

local dap = require("dap")
dap.adapters.codelldb = {
  type = "executable",
  command = "codelldb",
  args = { "--interpreter=dap", "-q", "-i", "dap", "--eval-command", "set print pretty on" }
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "codelldb",
    request = "launch",
    program = function()
      local build = vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      dap.repl.open()
      return build
    end,
    cwd = "${workspaceFolder}",
    runInTerminal = true,
    stopAtBeginningOfMainSubprogram = true,
  },
  {
    name = "Select and attach to process",
    type = "codelldb",
    request = "attach",
    program = function()
       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    pid = function()
       local name = vim.fn.input('Executable name (filter): ')
       return require("dap.utils").pick_process({ filter = name })
    end,
    stopOnEntry = true,
    cwd = '${workspaceFolder}'
  },
  {
    name = 'Attach to codelldbserver :1234',
    type = 'codelldb',
    request = 'attach',
    target = 'localhost:1234',
    program = function()
       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    stopOnEntry = true,
    cwd = '${workspaceFolder}'
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

--- signs
-- look at https://github.com/mfussenegger/nvim-dap/blob/master/lua/dap.lua#L397
local signs = {
  DapBreakpoint = { text = "●", texthl = "CursorLineNr", linehl = "", numhl = "" },
  DapBreakpointCondition = { text = "C", texthl = "CursorLineNr", linehl = "", numhl = "" },
  DapBreakpointRejected = { text = 'R', texthl = "CursorLineNr", linehl = '', numhl = '' },
  DapLogPoint = { text = 'L', texthl = "CursorLineNr", linehl = '', numhl = '' },
  DapStopped = { text = '▶', texthl = "CursorLineNr", linehl = 'debugPC', numhl = '' },
}

for key, val in pairs(signs) do
  if val ~= nil then
    vim.fn.sign_define(key, val)
  end
end
