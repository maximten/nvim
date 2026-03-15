return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({
        keymap = {
          fzf = {
            ["ctrl-k"] = "up",
            ["ctrl-j"] = "down",
            ["ctrl-q"] = "select-all+accept",
          },
        },
        files = {
          fd_opts = "--exclude .git --exclude node_modules --exclude '*.class'",
        },
        grep = {
          rg_opts = "--glob '!.git' --glob '!node_modules'",
        },
      })
    end,
  },
}
