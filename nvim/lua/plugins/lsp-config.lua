return {

	-- { "nvim-java/nvim-java" },
	{
		"williamboman/mason.nvim",
		config = function()
			-- require("java").setup()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"gopls",
					"pyright",
					"eslint",
					"clangd",
					"tailwindcss",
					"jsonls",
					"jdtls",
				},
			})
		end,
	},
	-- mason nvim dap utilizes mason to automatically ensure debug adapters you want installed are installed, mason-lspconfig will not automatically install debug adapters for us
	{
		"jay-babu/mason-nvim-dap.nvim",
		config = function()
			-- ensure the java debug adapter is installed
			require("mason-nvim-dap").setup({
				ensure_installed = { "java-debug-adapter", "java-test" },
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
			--  handlers
			local handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
			}

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
				-- Enable Inalay Hints if the lsp server supports it
				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true)
				end
			end

			-- LSP SETUP
			local servers = {
				"lua_ls",
				"tailwindcss",
				"eslint",
				"clangd",
				"jsonls",
			}

			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup({
					on_attach = on_attach,
					handlers = handlers,
					capabilities = capabilities,
				})
			end

			-- lua_ls setup
			--[[ lspconfig.lua_ls.setup({
				on_attach = on_attach,
				handlers = handlers,
				capabilities = capabilities,
			}) ]]

			-- configure typescript language server
			local function organize_imports()
				local params = {
					command = "_typescript.organizeImports",
					arguments = { vim.api.nvim_buf_get_name(0) },
				}
				vim.lsp.buf.execute_command(params)
			end

			lspconfig.ts_ls.setup({
				on_attach = on_attach,

				handlers = handlers,
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

			-- tailwindcss
			--[[ lspconfig.tailwindcss.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				handlers = handlers,
			}) ]]

			-- eslint
			--[[ lspconfig.eslint.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				handlers = handlers,
			}) ]]

			lspconfig.pyright.setup({
				on_attach = on_attach,

				handlers = handlers,
				capabilities = capabilities,

				filetypes = { "python" },
				-- root_dir = vim.loop.cwd(),
				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							diagnosticMode = "openFilesOnly",
							useLibraryCodeForTypes = true,
							typeCheckingMode = "basic",
							completeFunctionParens = true,
							autoImportCompletions = true,
							importFormat = "absolute",
						},
					},
				},
			})

			-- clangd setup
			--[[ lspconfig.clangd.setup({
				on_attach = on_attach,
				handlers = handlers,
				capabilities = capabilities,
			}) ]]

			-- gopls setup
			lspconfig.gopls.setup({
				on_attach = on_attach,
				handlers = handlers,
				capabilities = capabilities,
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = util.root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						experimentalPostfixCompletions = true,
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
							nillness = true,
							shadow = true,
						},
						staticcheck = true,
					},
				},
			})
		end,
	},
}
