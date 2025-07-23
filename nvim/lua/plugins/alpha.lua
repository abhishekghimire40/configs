return {
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		enabled = true,
		-- init = false,
		config = function()
			local dashboard = require("alpha.themes.dashboard")

			local logo = {
				"███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄   ",
				"███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄ ",
				"███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███ ",
				"███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███ ",
				"███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███ ",
				"███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███ ",
				"███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███ ",
				" ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀  ",
			}

			dashboard.section.header.val = logo


      -- stylua: ignore
      dashboard.section.buttons.val = {
        dashboard.button("n", "  New File", "<cmd>ene<CR>"),
        dashboard.button("f", "󰱼  Find Files", "<cmd>Telescope find_files<CR>"),
        dashboard.button("r", "  Find Recent Files", "<cmd>Telescope oldfiles<CR>"),
        dashboard.button("c", "  Configuration", "<cmd>cd ~/.config/nvim | edit init.lua<CR>"),
        dashboard.button("q", "  Quit NVIM", "<cmd>qa<CR>"),
      }

			for _, button in ipairs(dashboard.section.buttons.val) do
				button.opts.hl = "Comment"
				button.opts.hl_shortcut = ""
				button.opts.position = "center"
				button.opts.width = 25
			end
			dashboard.section.header.opts.hl = ""
			dashboard.section.footer.opts.hl = "Keyword"
			dashboard.opts.layout[1].val = 8

			local plugins = #vim.tbl_keys(require("lazy").plugins())
			local v = vim.version()
			local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
			local platform = vim.fn.has("win32") == 1 and "" or ""
			local greeting =
				string.format("󰂖 %d  %s %d.%d.%d  %s", plugins, platform, v.major, v.minor, v.patch, datetime)

			dashboard.section.footer.val = greeting

			require("alpha").setup(dashboard.opts)

			vim.api.nvim_create_autocmd("User", {
				pattern = "LazyVimStarted",
				callback = function()
					local stats = require("lazy").stats()
					local count = (math.floor(stats.startuptime * 100) / 100)

					local greeting = string.format(
						"󰂖 %d  %dm/s %s %d.%d.%d  %s",
						plugins,
						count,
						platform,
						v.major,
						v.minor,
						v.patch,
						datetime
					)

					dashboard.section.footer.val = greeting
					pcall(vim.cmd.AlphaRedraw)
				end,
			})
		end,
	},
}
