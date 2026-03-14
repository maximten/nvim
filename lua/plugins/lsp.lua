return {
  -- Mason: LSP/tool installer
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        ui = { border = "rounded" },
      })
    end,
  },

  -- Mason-lspconfig bridge
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        -- clangd handles C++; gdscript connects to running Godot editor
        ensure_installed = { "clangd" },
        automatic_installation = true,
      })
    end,
  },

  -- LSP config (Neovim 0.11+ native vim.lsp.config)
  {
    "hrsh7th/cmp-nvim-lsp",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- LSP keymaps (set on attach)
      local on_attach = function(_, bufnr)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end

        map("gd", vim.lsp.buf.definition, "Go to definition")
        map("gD", vim.lsp.buf.declaration, "Go to declaration")
        map("gr", vim.lsp.buf.references, "Find references")
        map("gi", vim.lsp.buf.implementation, "Go to implementation")
        map("K", vim.lsp.buf.hover, "Hover docs")
        map("<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        map("<leader>ds", vim.lsp.buf.document_symbol, "Document symbols")
        map("<leader>D", vim.lsp.buf.type_definition, "Type definition")
        map("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
        map("]d", vim.diagnostic.goto_next, "Next diagnostic")
        map("<leader>dl", "<cmd>Telescope diagnostics<cr>", "List diagnostics")
      end

      -- Diagnostic display
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        float = { border = "rounded" },
      })

      -- C++ via clangd
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

      -- GDScript: connects to the Godot editor's built-in LSP server
      -- Godot must be running with the project open for LSP to work.
      -- (Godot 4 uses port 6005, Godot 3 uses 6008)
      vim.lsp.config("gdscript", {
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "gdscript", "gd" },
        root_markers = { "project.godot" },
      })
      vim.lsp.enable("gdscript")
    end,
  },
}
