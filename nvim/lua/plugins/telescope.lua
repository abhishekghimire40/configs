return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			-- telescope load and keymap
			local builtin = require("telescope.builtin")
			local actions = require("telescope.actions")

			require("telescope").setup({
				defaults = {

					vimgrep_arguments = {
						"rg",
						"-L",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
					},
					-- file_sorter = require("telescope.sorters").get_fuzzy_file,
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["<C-x>"] = actions.delete_buffer,
							["<C-w>"] = actions.close,
						},
						n = {
							["<C-w>"] = actions.close,
						},
					},
					file_ignore_patterns = {
						"node_modules",
						"yarn.lock",
						"*.git",
						".sl",
						"_build",
						".next",
					},

					prompt_prefix = "   ",
					hidden = true,
					path_display = {
						"filename_first",
					},
				},

				extensions_list = { "fzf" },
			})

			-- Enable telescope fzf native, if installed
			-- pcall(require("telescope").load_extension, "fzf")

			-- find
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
			vim.keymap.set(
				"n",
				"<leader>fa",
				"<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
				{}
			)
			vim.keymap.set("n", "<leader>fb", "<cmd> Telescope buffers  <CR>", {})
			vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags <CR>", {})
			vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles <CR>", {})
			vim.keymap.set("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find <CR>", {})

			-- git
			vim.keymap.set("n", "<leader>cm", "<cmd>Telescope  git_commits<CR>", {})
			vim.keymap.set("n", "<leader>gs", "<cmd>Telescope  git_status<CR>", {})

			-- bookmarks
			vim.keymap.set("n", "<leader>ma", "<cmd>Telescope  marks<CR>", {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		-- This is your opts table
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
