-- Shared LSP on-attach keymaps
local function on_attach(client, bufnr)
  local map = function(keys, func, desc)
    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end
  map("gd", vim.lsp.buf.definition, "Go to definition")
  map("<leader>D", vim.lsp.buf.type_definition, "Type definition")
  map("gr", vim.lsp.buf.references, "Find references")
  map("gi", vim.lsp.buf.implementation, "Go to implementation")
  map("gD", vim.lsp.buf.declaration, "Go to declaration")
  map("K", vim.lsp.buf.hover, "Hover docs")
  map("<leader>ca", vim.lsp.buf.code_action, "Code action")
  map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
  map("<leader>ds", vim.lsp.buf.document_symbol, "Document symbols")
  map("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
  map("]d", vim.diagnostic.goto_next, "Next diagnostic")
  map("<leader>dl", "<cmd>FzfLua diagnostics_document<cr>", "List diagnostics")
end

return {
  -- Mason: LSP/tool installer
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({ ui = { border = "rounded" } })
    end,
  },

  -- Mason-lspconfig bridge (clangd only; Roslyn is pre-installed)
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd" },
        automatic_installation = true,
      })
    end,
  },

  -- C# / Unity via Roslyn LSP (pre-unpacked nuget at ~/Tools/Roslyn)
  -- For Unity: regenerate project files via Edit → Preferences → External Tools
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      require("roslyn").setup({
        exe = {
          "dotnet",
          "/home/doshirak/Tools/Roslyn/content/LanguageServer/linux-x64/Microsoft.CodeAnalysis.LanguageServer.dll",
        },
        config = {
          on_attach = on_attach,
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
        },
      })
    end,
  },

  -- C++ via clangd + shared diagnostic config
  {
    "hrsh7th/cmp-nvim-lsp",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        float = { border = "rounded" },
      })

      vim.lsp.config("clangd", {
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--completion-style=detailed",
          "--header-insertion=iwyu",
        },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_markers = { "compile_commands.json", ".clangd", ".git" },
      })
      vim.lsp.enable("clangd")
    end,
  },
}
