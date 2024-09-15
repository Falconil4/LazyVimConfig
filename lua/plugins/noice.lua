return {
  "folke/noice.nvim",
  opts = {
    routes = {
      {
        filter = {
          event = "notify",
          find = "No code actions available",
        },
        opts = { skip = true },
      },
    },
  },
}
