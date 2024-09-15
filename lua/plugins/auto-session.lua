return {
  "rmagatti/auto-session",
  lazy = false,
  config = function()
    require("auto-session").setup({
      post_restore_cmds = {
        "Trouble diagnostics toggle",
        "NvimTreeOpen",
      },
    })
  end,
}
