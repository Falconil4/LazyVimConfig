return {
  "folke/trouble.nvim",
  opts = function(_, opts)
    opts.open_no_results = true

    opts.keys = {
      ["l"] = "jump",
    }
  end,
}
