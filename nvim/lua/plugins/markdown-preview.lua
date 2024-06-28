return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
	lazy = false,
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	init = function()
		vim.g.mkdp_theme = "dark"
	end,
	config = function()
		-- binding for Markdown Preview
		-- M.mdpreview = {
		--   n = {
		--     ["<leader>mp"] = { "<cmd> MarkdownPreview<CR>", "Open Preview" },
		--     ["<leader>mc"] = { "<cmd> MarkdownPreviewStop<CR>", "Close Preview" },
		--   },
		-- }
		vim.keymap.set("n", "<leader>mp", "{<Cmd> MarkdownPreview <CR>}")
		vim.keymap.set("n", "<leader>ms", "{<Cmd> MarkdownPreviewStop <CR>}")
	end,
}
