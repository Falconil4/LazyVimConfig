return {
  "mfussenegger/nvim-dap",
  opts = function()
    local dap = require("dap")

    dap.listeners.before["event_terminated"]["test"] = function()
      vim.cmd("Trouble diagnostics toggle")
      vim.cmd("NvimTreeClose")

      vim.defer_fn(function()
        vim.cmd("Trouble diagnostics toggle")

        vim.defer_fn(function()
          vim.cmd("NvimTreeOpen")
        end, 200)
      end, 200)
    end

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
        env = "ASPNETCORE_ENVIRONMENT=Development",
        args = {
          "/p:EnvironmentName=Development",
          "--environment=Development",
        },
      },
      {
        type = "coreclr",
        name = "Attach",
        request = "attach",
        processId = function()
          return require("dap.utils").pick_process({
            filter = function(proc)
              return string.find(proc.name, vim.fn.getcwd():match("([^\\]+)$")) ~= nil
            end,
          })
        end,
      },
    }
  end,
}
