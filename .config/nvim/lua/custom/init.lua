if vim.g.vscode then

  vim.keymap.set('n', '<C-d>', '<C-d>zz')
  vim.keymap.set('n', '<C-u>', '<C-u>zz')
else
  local opt = vim.opt
  local g = vim.g

  opt.relativenumber = true
  opt.cursorline = true

  opt.smartindent = false
end
