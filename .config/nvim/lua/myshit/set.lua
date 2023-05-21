-- [[ Setting options ]]
-- See `:help vim.o`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.number = true
-- vim.opt.background = 'none'
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- vim.opt.list = false

vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.listchars:append "eol:↴"
-- vim.opt.expandtab = true
vim.opt.termguicolors = true
-- Set highlight on search
vim.o.hlsearch = true
vim.o.mouse = 'a'
vim.o.cursorline = false
vim.o.scrolloff = 4
-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'
-- Enable break indent
vim.o.breakindent = true
-- Save undo history
vim.o.undofile = true
-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'
-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'


-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

