# Neovim Config Keybindings

`<leader>` = `Space`

## Window Navigation

| Key | Action |
|-----|--------|
| `Ctrl+h` | Move to left window |
| `Ctrl+j` | Move to bottom window |
| `Ctrl+k` | Move to top window |
| `Ctrl+l` | Move to right window |

## File Tree (neo-tree)

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file tree |
| `<leader>o` | Focus file tree |

## Telescope

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Find buffers |
| `<leader>fr` | Recent files |
| `<leader>fs` | Grep string under cursor |

### Inside Telescope picker

| Key | Action |
|-----|--------|
| `Ctrl+j` | Next item |
| `Ctrl+k` | Previous item |
| `Ctrl+q` | Send selected to quickfix list |
| `Esc` | Close picker |

## Buffers

| Key | Action |
|-----|--------|
| `Shift+l` | Next buffer |
| `Shift+h` | Previous buffer |
| `<leader>bd` | Close buffer |

## File

| Key | Action |
|-----|--------|
| `<leader>w` | Save |
| `<leader>q` | Quit |

## Editing

| Key | Mode | Action |
|-----|------|--------|
| `J` | Visual | Move selection down |
| `K` | Visual | Move selection up |
| `<` | Visual | Indent left (stay in visual) |
| `>` | Visual | Indent right (stay in visual) |
| `Ctrl+d` | Normal | Scroll down (centered) |
| `Ctrl+u` | Normal | Scroll up (centered) |
| `n` | Normal | Next search result (centered) |
| `N` | Normal | Prev search result (centered) |

## LSP (active when a language server attaches)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Find references |
| `gi` | Go to implementation |
| `K` | Hover docs |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename symbol |
| `<leader>ds` | Document symbols |
| `<leader>D` | Type definition |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>dl` | List diagnostics (Telescope) |

## Completion (nvim-cmp, insert mode)

| Key | Action |
|-----|--------|
| `Ctrl+k` | Select previous item |
| `Ctrl+j` | Select next item |
| `Ctrl+b` | Scroll docs up |
| `Ctrl+f` | Scroll docs down |
| `Ctrl+Space` | Trigger completion |
| `Ctrl+e` | Abort completion |
| `Enter` | Confirm selection |
| `Tab` | Next item / expand or jump snippet |
| `Shift+Tab` | Previous item / jump back in snippet |
