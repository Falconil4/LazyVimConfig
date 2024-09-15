return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      local function my_on_attach(bufnr)
        local api = require("nvim-tree.api")

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
        vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close"))
        vim.keymap.set("n", "y", api.fs.copy.node, opts("Copy file"))
      end

      vim.keymap.set("n", "<Leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "File explorer" })

      require("nvim-tree").setup({
        on_attach = my_on_attach,
        update_focused_file = {
          enable = true,
        },
        view = {
          adaptive_size = true,
        },
      })
    end,
  },
}
