return {
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			require("dapui").setup()

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
	{
		"mfussenegger/nvim-dap",

		dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" },

		config = function()
			local dap = require("dap")
			-- dap keymaps
			vim.keymap.set("n", "<Leader>db", function()
				dap.toggle_breakpoint()
			end)
			vim.keymap.set("n", "<Leader>ds", function()
				dap.continue()
			end)
		end,
	},
	{
		"leoluz/nvim-dap-go",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("dap-go").setup({
				dap_configurations = {
					{
						-- Must be "go" or it will be ignored by the plugin
						type = "go",
						name = "Attach remote",
						mode = "remote",
						request = "attach",
					},
				},
			})
			-- dap-go keymaps
			vim.keymap.set("n", "<Leader>dm", function()
				require("dap-go").debug_test()
			end, { desc = "Debug closest method above cursor " })
			vim.keymap.set("n", "<Leader>dlm", function()
				require("dap-go").debug_last_test()
			end, { desc = "Run last debug again " })
		end,
	},
}
--[[ return {
	"mfussenegger/nvim-dap",

	dependencies = { "rcarriga/nvim-dap-ui", "leoluz/nvim-dap-go", "nvim-neotest/nvim-nio" },

	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("dapui").setup()
		require("dap-go").setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- dap keymaps
		vim.keymap.set("n", "<Leader>db", function()
			dap.toggle_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>ds", function()
			dap.continue()
		end)

		-- dap-go keymaps
		vim.keymap.set("n", "<Leader>dm", function()
			require("dap-go").debug_test()
		end, { desc = "Debug closest method above cursor " })
		vim.keymap.set("n", "<Leader>dlm", function()
			require("dap-go").debug_last_test()
		end, { desc = "Run last debug again " })
	end,
} ]]
