return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      lua_ls = {
        -- Custom root_dir configuration
        root_dir = function(fname)
          -- Find the nearest .git directory or init.lua, .luarc.json, or .luarc.jsonc
          local util = require("lspconfig.util")
          return util.find_git_ancestor(fname)
            or util.root_pattern("init.lua", ".luarc.json", ".luarc.jsonc")(fname)
            or util.path.dirname(fname)
        end,
      },
    },
  },
}
