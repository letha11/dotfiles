if vim.g.vscode then

  vim.keymap.set('n', '<C-d>', '<C-d>zz')
  vim.keymap.set('n', '<C-u>', '<C-u>zz')
else
  local opt = vim.opt
  local g = vim.g
  g.skip_ts_context_commentstring_module = true
  -- opt.autochdir = true
  -- g.autochdir = true

  opt.relativenumber = true
  opt.conceallevel = 1
  -- opt.cursorline = true
  -- opt.guicursor = ""

  opt.smartindent = false
end
