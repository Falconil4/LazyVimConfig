return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      omnisharp = {
        cmd = { "omnisharp" },
        root_dir = function(fname)
          local solution = require("lspconfig.util").root_pattern("*.sln")(fname)
          if solution ~= nil then
            return solution
          end
          return require("lspconfig.util").root_pattern("*.csproj")(fname)
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
