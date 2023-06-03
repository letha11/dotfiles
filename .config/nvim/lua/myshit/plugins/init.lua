-- bootstrapping lazy
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- setting lazy
require('lazy').setup({
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  'mfussenegger/nvim-dap',
  'manzeloth/live-server',
  'L3MON4D3/LuaSnip',
  'honza/vim-snippets',
  'rafamadriz/friendly-snippets',
  'navarasu/onedark.nvim',
  'folke/tokyonight.nvim',
  {
    'RRethy/vim-illuminate',
    config = function()
      require('myshit.plugins.illuminate');
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    config = function()
      require('gruvbox').setup({
        transparent_mode = true,
      })
    end,
  },
  'tpope/vim-surround',
  'folke/which-key.nvim',
  'mattn/emmet-vim',
  'mg979/vim-visual-multi', -- multi cursor
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },
      -- Additional lua configuration, makes nvim stuff amazing!
      {
        'folke/neodev.nvim',
        config = function()
          require('neodev').setup()
        end
      }
    },
  },
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    },
  },

  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'ayu_dark',
          component_separators = '|',
          section_separators = '',
        },

        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
      }
    end,
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require('myshit.plugins.null-ls');
    end,
  },


  {
    "nvim-neo-tree/neo-tree.nvim",
    version = "",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require('myshit.plugins.neotree')
    end,
  },


  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('myshit.plugins.bufferline')
    end,
  },


  -- {
  --   'lukas-reineke/indent-blankline.nvim',
  --   opts = {
  --     space_char_blankline = " ",
  --     show_current_context = true,
  --     show_current_context_start = true,
  --     char = '┊',
  --     show_trailing_blankline_indent = false,
  --     show_end_of_line = true,
  --   },
  -- },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local telescope = require('telescope')
      telescope.setup {}
      telescope.load_extension('fzf')
    end
  },
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
      require('myshit.plugins.treesitter')
    end,
  },
  -- Flutter
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function()
      require('myshit.plugins.flutter-tools')
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('myshit.plugins.toggleterm').setup()
    end
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },
  {
    'phaazon/hop.nvim',
    config = function()
      require('myshit.plugins.hop')
    end
  },

  {
    -- auto close tag
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup {
        autotag = {
          enable = true,
        }
      }
    end
  },

  {
    'zbirenbaum/copilot.lua',
    event = "InsertEnter",
    lazy = true,
    config = function()
      require("myshit.plugins.copilot")
    end,
  },

  {
    'kkoomen/vim-doge',
    config = function()
      vim.cmd("call doge#install()");
    end,
  },

  {
    'ludovicchabant/vim-gutentags',
    config = function()
      -- https://www.reddit.com/r/vim/comments/d77t6j/guide_how_to_setup_ctags_with_gutentags_properly/
      vim.g.gutentags_ctags_exclude = {
        '*.git',
        '*.svg',
        '*.hg',
        '*/tests/*',
        'build',
        'dist',
        '*sites/*/files/*',
        'bin',
        'node_modules',
        'bower_components',
        'cache',
        'compiled',
        'docs',
        'example',
        'bundle',
        'vendor',
        '*.md',
        '*-lock.json',
        '*.lock',
        '*bundle*.js',
        '*build*.js',
        '.*rc*',
        '*.json',
        '*.min.*',
        '*.map',
        '*.bak',
        '*.zip',
        '*.pyc',
        '*.class',
        '*.sln',
        '*.Master',
        '*.csproj',
        '*.tmp',
        '*.csproj.user',
        '*.cache',
        '*.pdb',
        'tags*',
        'cscope.*',
        -- '*.css',
        -- '*.less',
        -- '*.scss',
        '*.exe',
        '*.dll',
        '*.mp3',
        '*.ogg',
        '*.flac',
        '*.swp',
        '*.swo',
        '*.bmp',
        '*.gif',
        '*.ico',
        '*.jpg',
        '*.png',
        '*.rar',
        '*.zip',
        '*.tar',
        '*.tar.gz',
        '*.tar.xz',
        '*.tar.bz2',
        '*.pdf',
        '*.doc',
        '*.docx',
        '*.ppt',
        '*.pptx',
      }

      -- vim.g.gutentags_add_default_project_roots = false
      -- vim.g.gutentags_project_root = { 'package.json', '.git' }
      -- vim.g.gutentags_cache_dir = vim.fn.stdpath("data") .. '/ctags'
      -- vim.g.gutentags_generate_on_new = true
      -- vim.g.gutentags_generate_on_missing = true
      -- vim.g.gutentags_generate_on_write = true
      -- vim.g.gutentags_generate_on_empty_buffer = true
      -- vim.g.gutentags_modules = true
      -- vim.cmd([[command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')]])
      -- vim.g.gutentags_ctags_extra_args = { '--tag-relative=yes', '--fields=+ailmnS', }


      -- custom
      vim.g.gutentags_modules = { 'ctags' }
    end
  }
}, {})
