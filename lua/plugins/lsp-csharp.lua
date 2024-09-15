return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      omnisharp = {
        cmd = { "omnisharp" },
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern("*.sln")(fname)
        end,
        settings = {
          FormattingOptions = {
            OrganizeImports = true,
          },
          RoslynExtensionsOptions = {
            EnableImportCompletion = true,
          },
        },
      },
    },
  },
}
