local opt = vim.opt

-- Compatibility shim: ft_to_lang was removed in Neovim 0.11
if vim.treesitter.language.ft_to_lang == nil then
  vim.treesitter.language.ft_to_lang = vim.treesitter.language.get_lang
end

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- UI
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.splitbelow = true
opt.splitright = true
opt.wrap = false

-- Files
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- Completion
opt.completeopt = { "menuone", "noselect" }

-- Clipboard
opt.clipboard = "unnamedplus"

-- Update time
opt.updatetime = 250
opt.timeoutlen = 300
