vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard+=unnamedplus")

vim.opt.smartindent = true
vim.opt.breakindent = true

-- vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.undofile = true
-- vim.opt.mouse = a

vim.opt.textwidth = 100
vim.opt.colorcolumn = { 100 }
vim.opt.relativenumber = true

-- always keep 8lines above/below cursor unless at beginning/End of file
vim.opt.scrolloff = 10
-- Enable cursor line highlight
vim.opt.cursorline = true
-- Enable the signcolumn to prevent the screen from jumping
-- vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Enable code folding
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldmethod = "indent"

local map = vim.keymap.set

vim.g.mapleader = " "

-- insert mode keymaps
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- normal mode keymaps
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
map("n", "E", "$", { desc = "move beginning of line" })
map("n", "B", "^", { desc = "move end of line" })
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "file save" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "file copy whole" })
map("n", "<C-w>", "<cmd>bd<CR>", { desc = "delete current buffer if saved" })
map("n", "<C-x>", "<cmd>q<CR>", { desc = "delete buffer even if not saved" })

-- global lsp mappings
map("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "lsp diagnostic loclist" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "comment toggle", remap = true })
map("v", "<leader>/", "gc", { desc = "comment toggle", remap = true })
