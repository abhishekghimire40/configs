return {
  "ray-x/go.nvim",
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup()
    local map = vim.keymap.set
    local function opts(desc)
      return { buffer = bufnr, desc = "LSP " .. desc }
    end
    map("n", "<leader>gaj", "<cmd> GoAddTag  <CR>", opts("Add json struct tags"))
    map("n", "<leader>gay", "<cmd> GoAddTag  yaml<CR>", opts("Add yaml struct tags"))
    map("n", "<leader>gie", "<cmd> GoIfErr  yaml<CR>", opts("Add if/err snippet"))
    map("n", "<leader>gfs", "<cmd>   GoFillStruct<CR>", opts("Auto fill struct parameters"))
    map("n", "<leader>grj", "<cmd> GoRmTag json<CR>", opts("Remove json struct tags"))
    map("n", "<leader>gry", "<cmd> GoRmTag yaml<CR>", opts("Remove yaml struct tags"))
    map("n", "<leader>gct", "<cmd> GoClearTag <CR>", opts("Clear all struct tags"))
  end,
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
