return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "tsserver", "gopls", "pyright", "eslint" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local map = vim.keymap.set
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			local util = require("lspconfig/util")

			local on_attach = function(client, bufnr)
				local function opts(desc)
					return { buffer = bufnr, desc = "LSP " .. desc }
				end

				map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
				map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
				-- map("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
				map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Show signature help"))
				map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
				map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))

				map("n", "<leader>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts("List workspace folders"))

				map("n", "<leader>D", vim.lsp.buf.type_definition, opts("Go to type definition"))

				map("n", "<leader>ra", vim.lsp.buf.rename, opts("NvRenamer"))

				map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))

				-- Telescope  lsp keybindings
				-- map("n", "gr", vim.lsp.buf.references, opts("Show references"))
				map("n", "gr", require("telescope.builtin").lsp_references, opts("LSP: [G]oto [R]eferences"))
				map("n", "gi", require("telescope.builtin").lsp_implementations, opts("LSP: [G]oto [I]mplementation"))
				map(
					"n",
					"<leader>bs",
					require("telescope.builtin").lsp_document_symbols,
					opts("LSP: [B]uffer [S]ymbols")
				)

				map(
					"n",
					"<leader>ps",
					require("telescope.builtin").lsp_workspace_symbols,
					opts("LSP: [P]roject [S]ymbols")
				)
				map("i", "<A-k>", vim.lsp.buf.signature_help, opts("LSP: Signature Documentation"))
				--[[ if conf.signature and client.server_capabilities.signatureHelpProvider then
			  require("nvchad.lsp.signature").setup(client, bufnr)
			end ]]
			end
			--
			-- LSP SETUP

			-- lua_ls setup
			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- configure typescript language server
			local function organize_imports()
				local params = {
					command = "_typescript.organizeImports",
					arguments = { vim.api.nvim_buf_get_name(0) },
				}
				vim.lsp.buf.execute_command(params)
			end

			lspconfig.tsserver.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				commands = {
					OrganizeImports = {
						organize_imports,
						description = "Organize Imports",
					},
				},
				completions = {
					completeFunctionCalls = true,
				},
				init_options = {
					preferences = {
						disableSuggestions = true,
					},
				},
			})

			-- pyright setup
			lspconfig.pyright.setup({
				on_attach = on_attach,
				capabilities = capabilities,

				filetypes = { "python" },
			})

			-- gopls setup
			lspconfig.gopls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = util.root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
							nillness = true,
						},
					},
				},
			})

			-- keybindings for lsp
			--[[ vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {}) ]]
		end,
	},
}
