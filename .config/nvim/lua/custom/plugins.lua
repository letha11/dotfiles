local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	{
		"tpope/vim-surround",
		lazy = false,
	},
	{
		"mattn/emmet-vim",
		event = "InsertEnter",
	},
	{
		"mg979/vim-visual-multi", -- multi cursor
		lazy = false,
	},
	{
		"phaazon/hop.nvim",
		lazy = false,
		config = function()
			require("hop").setup()
		end,
	},

	{
		"kkoomen/vim-doge",
		-- lazy = false,
		event = "VeryLazy",
		config = function()
			vim.cmd("call doge#install()")
		end,
	},

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
        "nvimtools/none-ls.nvim",
				-- "jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

  {
    "microsoft/python-type-stubs",
    cond = false
  },

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},
	{
		"nvim-telescope/telescope.nvim",
		opts = overrides.telescope,
	},
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.blankline,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
  },

	-- Install a plugin
	-- {
	-- 	"max397574/better-escape.nvim",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require("better_escape").setup()
	-- 	end,
	-- },

	{
		"RRethy/vim-illuminate",
		lazy = false,
		config = function()
			require("custom.configs.illuminate")
		end,
	},

	{
		"akinsho/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		-- event = "VeryLazy",
    -- config = true,
		config = function()
			require("custom.configs.flutter-tools")
		end,
	},

  {
    "adalessa/laravel.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    keys = {
      { "<leader>la", ":Laravel artisan<cr>" },
      { "<leader>lr", ":Laravel routes<cr>" },
      {
        "<leader>lt",
        function()
          require("laravel.tinker").send_to_tinker()
        end,
        mode = "v",
        desc = "Laravel Application Routes",
      },
    },
    event = { "VeryLazy" },
    config = function()
      require("laravel").setup()
      require("telescope").load_extension "laravel"
    end,
  },

  {
    "rcarriga/nvim-notify",
    config = function()
        local notify = require("notify")
        -- this for transparency
        notify.setup({ background_colour = "#000000" })
        -- this overwrites the vim notify function
        vim.notify = notify.notify
    end
  },

	-- To make a plugin not be loaded
	{
	  "NvChad/nvim-colorizer.lua",
	  enabled = false
	},

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }
}

return plugins
