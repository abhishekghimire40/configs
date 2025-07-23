-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set clipboard+=unnamedplus")

vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.o.autoindent = true

vim.opt.undofile = true
vim.opt.swapfile = false
-- vim.opt.updatetime = 50
vim.opt.mouse = "a"
vim.opt.completeopt = { "menu", "menuone", "preview", "noselect" }

vim.opt.textwidth = 120
vim.opt.colorcolumn = { 120 }

-- always keep 8lines above/below cursor unless at beginning/End of file
vim.opt.scrolloff = 10
-- Enable cursor line highlight
vim.opt.cursorline = true
-- Enable the signcolumn to prevent the screen from jumping
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
