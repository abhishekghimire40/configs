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
vim.opt.number = true
vim.opt.relativenumber = true

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

-- Enable code folding

vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldmethod = "indent"

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- delete single character without copying into register
map("n", "x", '"_x"', opts)

-- vertical scroll and center
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- find and center
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- move line up and down in normal and visual mode
map("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
map("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)
map("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

-- stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- keep last yanked when pasting
map("v", "p", '"_dP"', opts)

-- window management
map("n", "<leader>v", "<C-w>v", opts) -- split window vertical
map("n", "<leader>h", "<C-w>s", opts) -- split window horizontal
map("n", "<leader>se", "<C-w>=", opts) -- split window horizontal
map("n", "<leader>xs", ":close<CR>", opts) -- split window horizontal

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
