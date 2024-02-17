
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- Overridden native keymaps (s/S/gs)
  --
  -- Basic motions, like Lightspeed jumps, should have the absolute least friction among all commands, since they are the most frequent.
  --
  --     s: for replacing one character, r is the adequate choice; for the rare case when one wants to continue inserting after that, using cl is more than fine
  --     S: cc is comfortable enough, and it is consistent with yy and dd
  --     gs: probably no one misses this shortcut for the :sleep command
  -- "ggandor/lightspeed.nvim",

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
})

vim.opt.clipboard:append("unnamedplus")
vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>e', '<CMD>call VSCodeCall("workbench.action.toggleSidebarVisibility")<CR>')
print('this working or nah??')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- vimgasm
vim.keymap.set('x', 'p', '"_dP')

-- Navigating through vscode window
vim.keymap.set('n', '<C-h>', '<CMD>call VSCodeCall("workbench.action.navigateLeft")<CR>')
vim.keymap.set('n', '<C-l>', '<CMD>call VSCodeCall("workbench.action.navigateRight")<CR>')
vim.keymap.set('n', '<C-k>', '<CMD>call VSCodeCall("workbench.action.navigateUp")<CR>')
vim.keymap.set('n', '<C-j>', '<CMD>call VSCodeCall("workbench.action.navigateDown")<CR>')

-- split window
vim.keymap.set('n', '<leader>o', '<CMD>call VSCodeCall("workbench.action.splitEditorRight")<CR>')
vim.keymap.set('n', '<leader>p', '<CMD>call VSCodeCall("workbench.action.splitEditorDown")<CR>')

vim.keymap.set('n', '<leader>q', '<CMD>call VSCodeCall("workbench.action.closeActiveEditor")<CR>')

-- navigating through vscode Tabs
vim.keymap.set('n', 'L', '<CMD>call VSCodeCall("workbench.action.nextEditorInGroup")<CR>')
vim.keymap.set('n', 'H', '<CMD>call VSCodeCall("workbench.action.previousEditorInGroup")<CR>')

vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('i', 'jk', '<Esc>')
