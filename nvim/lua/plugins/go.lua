return {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()',
  config = function()
    require("go").setup()
  end,
  keys = {
    { "<leader>Gaj", "<cmd>GoAddTag<CR>", desc = "Go: Add json tags" },
    { "<leader>Gay", "<cmd>GoAddTag yaml<CR>", desc = "Go: Add yaml tags" },
    { "<leader>Gie", "<cmd>GoIfErr<CR>", desc = "Go: Insert if err" },
    { "<leader>Gfs", "<cmd>GoFillStruct<CR>", desc = "Go: Fill struct" },
    { "<leader>Grj", "<cmd>GoRmTag json<CR>", desc = "Go: Remove json tags" },
    { "<leader>Gry", "<cmd>GoRmTag yaml<CR>", desc = "Go: Remove yaml tags" },
    { "<leader>Gct", "<cmd>GoClearTag<CR>", desc = "Go: Clear all tags" },
  },
}
