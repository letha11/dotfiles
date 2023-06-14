---@type MappingsTable
local M = {}

M.general = {
	-- n = {
	--   ["F"] = { ":", "enter command mode", opts = { nowait = true } },
	-- },
}

M.nvimtree = {
	plugin = true,

	n = {
		["<A-1>"] = { ":NvimTreeToggle<CR>", "Toggle NvimTree" },
	},
}

M.lspconfig = {
	n = {
		["<C-A-l>"] = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"LSP formatting",
		},
	},
}

M.hop = {
	n = {
		["F"] = { "<cmd>HopChar1<CR>", "Hop Word" },
	},
	v = {
		["F"] = { "<cmd>HopChar1<CR>", "Hop Word" },
	},
}

M.tabufline = {
	-- cycle through buffers
	n = {
		["<S-l>"] = {
			function()
				require("nvchad_ui.tabufline").tabuflineNext()
			end,
			"Goto next buffer",
		},

		["<S-h>"] = {
			function()
				require("nvchad_ui.tabufline").tabuflinePrev()
			end,
			"Goto prev buffer",
		},

		-- close buffer + hide terminal buffer
		["<leader>q"] = {
			function()
				require("nvchad_ui.tabufline").close_buffer()
			end,
			"Close buffer",
		},
	},
}

M.telescope = {
	plugin = true,
	n = {
		["<C-p>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
	},
}

M.disabled = {
	n = {
		["<C-n>"] = false,
		["<leader>e"] = false,
	},
}
-- more keybinds!

return M
