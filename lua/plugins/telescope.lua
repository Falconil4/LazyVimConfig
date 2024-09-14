return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    print(opts.defaults.mappings)
    opts.defaults.mappings = vim.tbl_deep_extend("force", opts.defaults.mappings, {
      i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
      },
    })
  end,
  keys = {
    {
      "<leader>fw",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Live Grep",
    },
  },
}
