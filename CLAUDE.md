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
| `telescope.lua` | telescope + fzf-native (requires `make` at build time) |
| `treesitter.lua` | nvim-treesitter (cpp, c, gdscript, lua, vim, vimdoc) |
| `lsp.lua` | mason → mason-lspconfig → nvim-lspconfig (clangd for C++, gdscript for Godot) |
| `completion.lua` | nvim-cmp + LuaSnip + friendly-snippets |

## LSP specifics

**C++**: clangd is installed via Mason. Needs a `compile_commands.json` or `.clangd` file at the project root for header resolution.

**GDScript**: `lspconfig.gdscript` connects to Godot's built-in LSP server (port 6005 for Godot 4, 6008 for Godot 3). Godot must be running with the project open for the LSP to connect.

## Adding plugins

Create a new file in `lua/plugins/` returning a lazy.nvim spec:

```lua
return {
  { "author/plugin-name", config = function() require("plugin-name").setup({}) end },
}
```

## Applying changes

Changes to Lua files take effect after restarting Neovim or running `:source %` on `init.lua`. Plugin changes (add/remove) require `:Lazy sync`. Mason-installed tools update via `:MasonUpdate`.
