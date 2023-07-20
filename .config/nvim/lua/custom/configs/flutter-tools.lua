local lspconfig = require("lspconfig");
-- local util = lspconfig.util

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

require('flutter-tools').setup {
	-- ui = { border = as.ui.current.border },
	debugger = {
		enabled = true,
		run_via_dap = true,
		exception_breakpoints = {},
	},
	outline = { auto_open = false },
	decorations = {
		statusline = { device = true, app_version = true },
	},
	widget_guides = { enabled = true, debug = false },
	dev_log = { enabled = false, open_cmd = 'tabedit' },
	lsp = {
		color = {
			enabled = true,
			background = true,
			virtual_text = false,
		},
		settings = {
			showTodos = true,
			renameFilesWithClasses = 'prompt',
			updateImportsOnRename = true,
			completeFunctionCalls = true,
			lineLength = 120,
		},
    on_attach = on_attach,
    capabilities = capabilities,
	},
}

