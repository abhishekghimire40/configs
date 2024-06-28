return {
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
}
