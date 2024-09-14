-- bootstrap lazy.nvim, LazyVim and your plugins

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.defer_fn(function()
      vim.cmd("Trouble diagnostics toggle")
      vim.defer_fn(function()
        vim.cmd("Neotree")
      end, 100)
    end, 1000)
  end,
})

require("config.lazy")
