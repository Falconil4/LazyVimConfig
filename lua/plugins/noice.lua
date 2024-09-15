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
      {
        filter = {
          event = "msg_show",
          find = "%d+B$",
        },
        opts = { skip = true },
      },
    },
  },
}
