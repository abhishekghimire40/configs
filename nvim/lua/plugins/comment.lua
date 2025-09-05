-- ~/.config/nvim/lua/plugins/comment.lua
return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("Comment").setup()

    -- Optional: map <leader>/ manually (if you want to override LazyVim defaults)
    vim.keymap.set("n", "<leader>/", function()
      require("Comment.api").toggle.linewise.current()
    end, { desc = "Toggle Comment (line)", noremap = true, silent = true })

    vim.keymap.set("v", "<leader>/", function()
      require("Comment.api").toggle.linewise(vim.fn.visualmode())
    end, { desc = "Toggle Comment (visual)", noremap = true, silent = true })
  end,
}
