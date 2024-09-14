return {
  "nvim-telescope/telescope.nvim",
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
