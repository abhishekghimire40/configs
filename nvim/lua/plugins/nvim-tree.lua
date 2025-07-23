return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local HEIGHT_RATIO = 0.9 -- You can change this
		local WIDTH_RATIO = 0.7 -- You can change this too
		require("nvim-tree").setup({

			filters = {
				dotfiles = false,
				exclude = { vim.fn.stdpath("config") .. "/lua/custom" },
			},
			disable_netrw = true,
			hijack_netrw = true,
			hijack_cursor = true,
			hijack_unnamed_buffer_when_opening = false,
			sync_root_with_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = false,
			},
			view = {
				relativenumber = true,
				float = {
					enable = true,
					open_win_config = function()
						local screen_w = vim.opt.columns:get()
						local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
						local window_w = screen_w * WIDTH_RATIO
						local window_h = screen_h * HEIGHT_RATIO
						local window_w_int = math.floor(window_w)
						local window_h_int = math.floor(window_h)
						local center_x = (screen_w - window_w) / 2
						local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
						return {
							border = "rounded",
							relative = "editor",
							row = center_y,
							col = center_x,
							width = window_w_int,
							height = window_h_int,
						}
					end,
				},
				width = function()
					return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
				end,
			},
			git = {
				enable = true,
				ignore = true,
			},
			filesystem_watchers = {
				enable = true,
			},
			actions = {
				open_file = {
					resize_window = true,
				},
			},

			renderer = {
				root_folder_label = false,
				highlight_git = false,
				highlight_opened_files = "none",

				indent_markers = {
					enable = false,
				},

				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = false,
					},

					glyphs = {
						default = "󰈚",
						symlink = "",
						-- folder = {
						-- 	default = "",
						-- 	empty = "",
						-- 	empty_open = "",
						-- 	open = "",
						-- 	symlink = "",
						-- 	symlink_open = "",
						-- 	arrow_open = "",
						-- 	arrow_closed = "",
						-- },
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
		})
	end,

	-- Neotree focus
	vim.keymap.set("n", "<leader>e", "<Cmd>NvimTreeToggle <CR>"),
	-- Neotree toggle
	vim.keymap.set("n", "<leader>q", "<Cmd>NvimTreeFocus<CR>"),
}
--[[ return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    opts = {
      filesystem = {
        follow_current_file = true,
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          -- hide_by_name = {
          -- 	-- '.git',
          -- 	-- '.DS_Store',
          -- 	-- 'thumbs.db',
          -- },
          never_show = {},
        },
      },
    }
    -- keymaps

    -- Neotree focus
    vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>")
    -- Neotree toggle
    vim.keymap.set("n", "<leader>q", "<Cmd>Neotree focus<CR>")
  end,
} ]]
