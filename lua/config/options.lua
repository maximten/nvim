local opt = vim.opt

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
