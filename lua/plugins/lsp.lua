return {
  "neovim/nvim-lspconfig",
  opts = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "gI", false }
    keys[#keys + 1] = { "gi", vim.lsp.buf.implementation, desc = "Goto Implementation" }
  end,
}
