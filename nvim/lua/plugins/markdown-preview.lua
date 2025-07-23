return {
	-- Install markdown preview, use npx if available.
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = function(plugin)
		if vim.fn.executable("npx") then
			vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
		else
			vim.cmd([[Lazy load markdown-preview.nvim]])
			vim.fn["mkdp#util#install"]()
		end
	end,
	init = function()
		if vim.fn.executable("npx") then
			vim.g.mkdp_filetypes = { "markdown" }
		end

		vim.g.mkdp_theme = "dark"
	end,

	config = function()
		-- binding for Markdown Preview
		vim.keymap.set("n", "<leader>mp", "{<Cmd> MarkdownPreview <CR>}")
		vim.keymap.set("n", "<leader>ms", "{<Cmd> MarkdownPreviewStop <CR>}")
	end,
}
-- return {
-- 	"iamcco/markdown-preview.nvim",
-- 	cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
-- 	lazy = false,
-- 	build = function()
-- 		vim.fn["mkdp#util#install"]()
-- 	end,
-- 	init = function()
-- 		vim.g.mkdp_theme = "dark"
-- 	end,
-- 	config = function()
-- 		-- binding for Markdown Preview
-- 		-- M.mdpreview = {
-- 		--   n = {
-- 		--     ["<leader>mp"] = { "<cmd> MarkdownPreview<CR>", "Open Preview" },
-- 		--     ["<leader>mc"] = { "<cmd> MarkdownPreviewStop<CR>", "Close Preview" },
-- 		--   },
-- 		-- }
-- 		vim.keymap.set("n", "<leader>mp", "{<Cmd> MarkdownPreview <CR>}")
-- 		vim.keymap.set("n", "<leader>ms", "{<Cmd> MarkdownPreviewStop <CR>}")
-- 	end,
-- }
