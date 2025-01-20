return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		event = "VeryLazy",
		config = function()
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.diagnostics.mypy,
					-- null_ls.builtins.diagnostics.ruff,
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.isort,
					--				null_ls.builtins.diagnostics.eslint,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.shfmt.with({ arg = { "-i", "4" } }),
					null_ls.builtins.formatting.clang_format,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.gofumpt,
					null_ls.builtins.formatting.goimports_reviser,
					null_ls.builtins.formatting.golines,
					-- # FORMATTING #
					null_ls.builtins.formatting.google_java_format.with({ extra_args = { "--aosp" } }),
					-- # DIAGNOSTICS #
					null_ls.builtins.diagnostics.checkstyle.with({
						extra_args = {
							"-c",
							vim.fn.expand("~/dotfiles/config/google_checks.xml"),
						},
					}),
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({
							group = augroup,
							buffer = bufnr,
						})
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end,
			})
		end,

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {}),
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		opt = {
			ensure_installed = {
				"checkstyle",
				"google-java-format",
			},
		},
	},
}
