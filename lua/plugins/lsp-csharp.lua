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
            EnableAsyncCompletion = true,
            EnableAnalyzersSupport = true,
          },
        },
        handlers = {
          ["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
            if not result or vim.tbl_isempty(result.diagnostics) then
              return
            end

            local ignore_list = { "IDE0160" }
            local filtered_diagnostics = {}

            for _, diagnostic in ipairs(result.diagnostics) do
              if not vim.tbl_contains(ignore_list, diagnostic.code) then
                table.insert(filtered_diagnostics, diagnostic)
              end
            end

            result.diagnostics = filtered_diagnostics
            vim.lsp.handlers["textDocument/publishDiagnostics"](_, result, ctx, config)
          end,
        },
      },
    },
  },
}
