return {
  "mfussenegger/nvim-dap",
  opts = function(_, opts)
    local dap = require("dap")

    dap.adapters.coreclr = {
      type = "executable",
      command = "/usr/local/bin/netcoredbg/netcoredbg",
      args = { "--interpreter=vscode" },
    }

    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "Launch with build",
        request = "launch",
        program = function()
          os.execute("dotnet build")
          return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
        end,
      },
      {
        type = "coreclr",
        name = "Attach",
        request = "attach",
        processId = require("dap.utils").pick_process,
      },
    }
  end,
}
