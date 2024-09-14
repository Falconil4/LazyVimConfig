return {
  "max397574/better-escape.nvim",
  config = function()
    require("better_escape").setup({
      mappings = {
        t = { j = { false } }, --lazygit navigation fix
        v = { j = { k = false } }, -- visual select fix
      },
    })
  end,
}
