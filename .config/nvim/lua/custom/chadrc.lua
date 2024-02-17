---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require("custom.highlights")

M.ui = {
	-- theme = "tundra",
	-- theme_toggle = { "gruvbox", "one_light" },
	-- hl_override = {
	--   CursorLine = {
	--     bg="white",
	--   },
	-- },
	-- transparency = true,

	telescope = {
		style = "borderless",
	},

	cmp = {
		selected_item_bg = "simple",
		icons = false,
		border_color = "folder_bg",
	},

	tabufline = {
		enabled = true,
	},

	hl_override = highlights.override,
	hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require("custom.mappings")


return M
