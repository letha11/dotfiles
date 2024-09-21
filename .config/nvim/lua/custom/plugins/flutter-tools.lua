return {
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function()
      require('flutter-tools').setup {
        -- debugger = {
        --   enabled = true,
        --   run_via_dap = true,
        --   exception_breakpoints = {},
        -- },
        -- outline = { auto_open = false },
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
            analysisExcludedFolders = { '<path-to-flutter-sdk-packages>' },
            updateImportsOnRename = true,
            enableSnippets = true,
            completeFunctionCalls = true,
            lineLength = 80,
          },
        },
      }
    end,
  },
}
