return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mason-org/mason.nvim",
    },
    opts = function()
      local dap = require("dap")

      -- FIX 1: Safe initialization for the defaults table
      -- This ensures we don't crash if the table doesn't exist yet
      dap.defaults.elixir = dap.defaults.elixir or {}
      -- FIX 2: Disable Exception Breakpoints explicitly
      -- This stops the "Debugger request setExceptionBreakpoints not supported" error
      dap.defaults.elixir.exception_breakpoints = {}

      -- Standard path to the debugger script
      local mason_path = vim.fn.stdpath("data") .. "/mason/packages/elixir-ls/debug_adapter.sh"

      -- 1. Define the Adapter
      dap.adapters.elixir = {
        type = "executable",
        command = mason_path,
        args = {},
      }

      -- 2. Define the Configurations
      dap.configurations.elixir = {
        {
          type = "elixir",
          name = "Run Current File (.exs)", -- <--- USE THIS FOR SMALL CODE
          request = "launch",
          task = "run",
          taskArgs = { "${file}" }, -- This passes the current open file to mix run
          projectDir = "${workspaceFolder}",
        },
        {
          type = "elixir",
          name = "Run Current Test",
          request = "launch",
          task = "test",
          taskArgs = { "--trace" },
          projectDir = "${workspaceFolder}",
          requireFiles = {
            "test/**/test_helper.exs",
            "test/**/*_test.exs",
          },
        },
        {
          type = "elixir",
          name = "Debug Phoenix (phx.server)",
          request = "launch",
          task = "phx.server",
          projectDir = "${workspaceFolder}",
        },
        {
          type = "elixir",
          name = "Run Mix (Default)",
          request = "launch",
          task = "run",
          taskArgs = { "--no-halt" },
          projectDir = "${workspaceFolder}",
        },
      }
      return {}
    end,
  },
}
