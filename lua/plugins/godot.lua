return {
  -- nvim-lspconfig: required by godotdev.nvim even though we use native vim.lsp.config
  { "neovim/nvim-lspconfig" },

  {
    "Mathijs-Bakker/godotdev.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      { "nvim-treesitter/nvim-treesitter", lazy = false },
    },
    ft = { "gdscript", "gd", "gdshader" },
    config = function()
      require("godotdev").setup({})
    end,
  },
}
