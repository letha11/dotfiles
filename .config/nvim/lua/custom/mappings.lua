---@type MappingsTable
local M = {}


M.general = {
	n = {
		["<leader>o"] = { "<cmd>vsplit<CR>", "Split window Vertically", opts = { silent = true } },
		["<leader>p"] = { "<cmd>split<CR>", "Split window Horizontally", opts = { silent = true } },
	},

	i = {
		["jj"] = { "<Esc>", "Better escape" },
		["jk"] = { "<Esc>", "Better escape" },
		["<C-c>"] = { "<Esc>", "Better escape" },
	},
	-- vim.keymap.set('n', '<leader>o', '<cmd>vsplit<CR>', { silent = true }) -- Vertical Split
	-- vim.keymap.set('n', '<leader>p', '<cmd>split<CR>', { silent = true })  -- Horizontal Split
}

M.nvimtree = {
	plugin = true,

	n = {
		["<leader>e"] = { ":NvimTreeToggle<CR>", "Toggle NvimTree" },
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

-- M.hop = {
-- 	n = {
-- 		["F"] = { "<cmd>HopChar1<CR>", "Hop Word" },
-- 	},
-- 	v = {
-- 		["F"] = { "<cmd>HopChar1<CR>", "Hop Word" },
-- 	},
-- }

M.tabufline = {
  plugin = true,
	-- cycle through buffers
	n = {
		["<S-l>"] = {
			function()
				require("nvchad.tabufline").tabuflineNext()
			end,
			"Goto next buffer",
		},

		["<S-h>"] = {
			function()
				require("nvchad.tabufline").tabuflinePrev()
			end,
			"Goto prev buffer",
		},

		-- close buffer + hide terminal buffer
		["<leader>q"] = {
			function()
				require("nvchad.tabufline").close_buffer()
			end,
			"Close buffer",
		},
	},
}

M.telescope = {
	plugin = true,
	n = {
		["<C-p>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
		["<leader>da"] = {
			"<cmd> Telescope diagnostics <CR>",
			"See diagnostics within the project",
		},
	},
}

M.disabled = {
	n = {
    ["<tab>"] = false,
    ["<S-tab>"] = false,
    ["<leader>x"] = false,
		["<C-n>"] = false,
		["<leader>e"] = false,
	},
  i = {
    -- ["<C-j>"] = false,
    -- ["<C-k>"] = false,
  }
}
-- more keybinds!

return M
