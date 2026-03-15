# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture

This is a Neovim configuration using **lazy.nvim** as the plugin manager. The entry point is `init.lua`, which bootstraps lazy.nvim and loads modules from `lua/`.

```
init.lua                    ← bootstraps lazy.nvim, loads config.options, config.keymaps, then plugins/
lua/config/options.lua      ← vim.opt settings
lua/config/keymaps.lua      ← all keymaps; <leader> = Space
lua/plugins/*.lua           ← each file returns a lazy.nvim plugin spec table
```

lazy.nvim auto-discovers all files under `lua/plugins/` — adding a new plugin spec file there is enough to activate it.

## Plugin overview

| File | Plugins |
|------|---------|
| `colorscheme.lua` | tokyonight (loaded eagerly, priority 1000) |
| `ui.lua` | lualine, nvim-web-devicons, which-key |
| `filetree.lua` | neo-tree v3 |
| `telescope.lua` | fzf-lua (replaces telescope) |
| `treesitter.lua` | nvim-treesitter (cpp, c, gdscript, c_sharp, lua, vim, vimdoc) |
| `lsp.lua` | mason → mason-lspconfig → nvim-lspconfig (clangd, csharp_ls, gdscript) |
| `completion.lua` | nvim-cmp + LuaSnip + friendly-snippets |

## LSP specifics

LSP uses **Neovim 0.11+ native `vim.lsp.config`/`vim.lsp.enable`** — not nvim-lspconfig. All three servers are configured in `lua/plugins/lsp.lua`.

**C++**: clangd via Mason. Needs `compile_commands.json` or `.clangd` at the project root for header resolution.

**C# / Unity**: csharp-ls via Mason (requires .NET SDK). Root is detected by finding a `.sln` or `.csproj` file. For Unity projects, regenerate `.csproj` files via Edit → Preferences → External Tools → Regenerate project files.

**GDScript**: Connects to Godot's built-in LSP (port 6005 for Godot 4, 6008 for Godot 3). Godot must be running with the project open.

## Adding plugins

Create a new file in `lua/plugins/` returning a lazy.nvim spec:

```lua
return {
  { "author/plugin-name", config = function() require("plugin-name").setup({}) end },
}
```

## Applying changes

Changes to Lua files take effect after restarting Neovim or `:source %` on `init.lua`. Plugin changes (add/remove) require `:Lazy sync`. Mason-installed tools update via `:MasonUpdate`.
