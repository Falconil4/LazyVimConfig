return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      omnisharp = {
        -- Specify the location of the Omnisharp executable if necessary
        cmd = { "omnisharp" },
        -- Configure the root directory to detect a C# project
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern("*.csproj", "*.sln")(fname)
        end,
        settings = {
          -- Additional settings for OmniSharp if needed
          omnisharp = {
            enableRoslynAnalyzers = true,
            organizeImportsOnFormat = true,
          },
        },
      },
    },
  },
}
