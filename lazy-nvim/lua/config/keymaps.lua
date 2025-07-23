-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- toggle comment in normal mode
map("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle Comment" })

-- -- toggle comment in visualmode
-- map("v", "<leader>/", function()
--   require("Comment.api").toggle.linewise(vim.fn.visualmode())
-- end, { desc = "Toggle Comment" })
--
-- -- find in current buffer
-- map("n", "<leader>sx", function()
--   require("telescope.builtin").current_buffer_fuzzy_find()
-- end, { desc = "Grep in Buffer" })

-- Delete single character without copying into register
map("n", "x", '"_x"', { noremap = true, silent = true, desc = "Delete without yanking" })

-- Vertical scroll and center
map("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true, desc = "Scroll down & center" })
map("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true, desc = "Scroll up & center" })

-- Find next/prev and center
map("n", "n", "nzzzv", { noremap = true, silent = true, desc = "Find next and center" })
map("n", "N", "Nzzzv", { noremap = true, silent = true, desc = "Find prev and center" })

map("v", "p", '"_dP"', { noremap = true, silent = true, desc = "Paste without overwriting yank" })

map("i", "<C-b>", "<ESC>^i", { desc = "Move to beginning of line" })
map("i", "<C-e>", "<End>", { desc = "Move to end of line" })
map("i", "<C-h>", "<Left>", { desc = "Move left" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })
map("i", "<C-j>", "<Down>", { desc = "Move down" })
map("i", "<C-k>", "<Up>", { desc = "Move up" })
