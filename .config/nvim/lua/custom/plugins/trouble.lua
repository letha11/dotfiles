return {
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    cmd = 'Trouble',
    keys = {
      {
        '<leader>dx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>dX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
    -- config = function()
    --   -- Lua
    --   vim.keymap.set('n', '<leader>dx', function()
    --     require('trouble').toggle()
    --   end)
    --   vim.keymap.set('n', '<leader>dw', function()
    --     require('trouble').toggle 'workspace_diagnostics'
    --   end)
    --   vim.keymap.set('n', '<leader>dd', function()
    --     require('trouble').toggle 'document_diagnostics'
    --   end)
    --   vim.keymap.set('n', '<leader>dq', function()
    --     require('trouble').toggle 'quickfix'
    --   end)
    --   vim.keymap.set('n', '<leader>dl', function()
    --     require('trouble').toggle 'loclist'
    --   end)
    --   vim.keymap.set('n', 'gR', function()
    --     require('trouble').toggle 'lsp_references'
    --   end)
    -- end,
  },
}
