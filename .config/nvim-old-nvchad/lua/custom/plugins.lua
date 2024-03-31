local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = false,
    opts = {
      enable_autocmd = false,
    },
    -- config = function()
    --   require('ts_context_commentstring').setup {
    --     enable_autocmd = false,
    --   }
    -- end
  },

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
  -- {
  --   "phaazon/hop.nvim",
  --   lazy = false,
  --   config = function()
  --     require("hop").setup()
  --   end,
  -- },

  {
    "ThePrimeagen/harpoon",
    lazy = false,
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require('custom.configs.harpoon-config')
    end,
  },

  -- {
  --   "kkoomen/vim-doge",
  --   -- lazy = false,
  --   event = "VeryLazy",
  --   config = function()
  --     vim.cmd("call doge#install()")
  --   end,
  -- },

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
    cond = false,
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

  {
    "numToStr/Comment.nvim",
    opts = overrides.comment,
    config = function()
      local prehook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
      require("Comment").setup({
        pre_hook = prehook,
        post_hook = nil,
      })
    end,
    -- lazy = false,
  },

  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    -- build = "make install_jsregexp",
    -- opts = overrides.luasnip,
    -- config = overrides.luasnip,
    config = function(_, opts)
      require("plugins.configs.others").luasnip(opts)

      local luasnip = require("luasnip")
      -- luasnip.filetype_extend("javascriptreact", { "html" })
      -- luasnip.filetype_extend("javascript", { "javascriptreact" })
      -- luasnip.filetype_extend("javascript", { "html" })
      -- luasnip.filetype_extend("typescript", { "javascriptreact" })
      -- luasnip.filetype_extend("typescript", { "html" })
      luasnip.filetype_extend("typescript", { "javascript" })
      luasnip.filetype_extend("javascriptreact", { "html" })
      luasnip.filetype_extend("typescriptreact", { "html" })

      require("luasnip.loaders.from_vscode")
    end,
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

  -- {
  --   "adalessa/laravel.nvim",
  --   dependencies = {
  --     "nvim-telescope/telescope.nvim",
  --     "tpope/vim-dotenv",
  --     "MunifTanjim/nui.nvim",
  --   },
  --   cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
  --   keys = {
  --     { "<leader>la", ":Laravel artisan<cr>" },
  --     { "<leader>lr", ":Laravel routes<cr>" },
  --     {
  --       "<leader>lt",
  --       function()
  --         require("laravel.tinker").send_to_tinker()
  --       end,
  --       mode = "v",
  --       desc = "Laravel Application Routes",
  --     },
  --   },
  --   event = { "VeryLazy" },
  --   config = function()
  --     require("laravel").setup()
  --     require("telescope").load_extension("laravel")
  --   end,
  -- },

  -- {
  --   "rcarriga/nvim-notify",
  --   config = function()
  --     local notify = require("notify")
  --     -- this for transparency
  --     notify.setup({ background_colour = "#000000" })
  --     -- this overwrites the vim notify function
  --     vim.notify = notify.notify
  --   end,
  -- },

  -- To make a plugin not be loaded
  {
    "NvChad/nvim-colorizer.lua",
    -- enabled = false,
    config = function(_, opts)
      require("colorizer").setup({})
    end,
  },

  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    config = function()
      require("custom.configs.obsidian")
    end,
    -- opts = {
    --   workspaces = {
    --     {
    --       name = "personal",
    --       path = "~/notes",
    --     },
    --     -- {
    --     --   name = "work",
    --     --   path = "~/vaults/work",
    --     -- },
    --   },
    --
    --   -- see below for full list of options 👇
    -- },
  },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }

  {
    "zbirenbaum/copilot.lua",
    enabled = true,
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("custom.configs.copilot")
    end,
  },

  {
    "windwp/nvim-autopairs",
    event = "insertenter",
    opts = {}, -- this is equalent to setup({}) function
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {
      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
        filetypes = { "html", "xml" },
      },
    },
  },
}

return plugins
