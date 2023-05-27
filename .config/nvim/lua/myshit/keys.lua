local wk = require('which-key')

-- Keyboard Mapping
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

--
-- LSP
--
vim.keymap.set('n', '<C-A-l>', function()
	vim.lsp.buf.format { async = true }
end, { silent = true })

--
-- Window keymap
--
vim.keymap.set('n', '<leader>o', '<cmd>vsplit<CR>', { silent = true }) -- Vertical Split
vim.keymap.set('n', '<leader>p', '<cmd>split<CR>', { silent = true })  -- Horizontal Split
vim.keymap.set('n', '<C-j>', '<C-W>j', { silent = true })              -- Focus bottom window
vim.keymap.set('n', '<C-k>', '<C-W>t', { silent = true })              -- Focus top window
vim.keymap.set('n', '<C-h>', '<cmd>wincmd h<CR>', { silent = true })   -- Focus left window
vim.keymap.set('n', '<C-l>', '<cmd>wincmd l<CR>', { silent = true })   -- Focus right window
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', { silent = true })      -- Quit window/buffer
vim.keymap.set('n', '<leader><S-q>', '<cmd>qa<CR>', { silent = true }) -- Quit All window/buffer
-- Resizing Window
vim.keymap.set("n", "=", '<cmd>vertical resize +5<cr>')                -- make the window bigger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]])              -- make the window smaller vertically
vim.keymap.set("n", "+", '<cmd>horizontal resize +2<cr>')              -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]])            -- make the window smaller horizontally by pressing shift and -

--
-- Diagnostic keymaps
--
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>l', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer' })

wk.register({
	s = {
		name = "Search",
		f = { "<cmd>Telescope find_files<cr>", "Search File" },
		h = { "<cmd>Telescope help_tags<cr>", "Search Help" },
		w = { "<cmd>Telescope grep_string<cr>", "Search current Word" },
		g = { "<cmd>Telescope live_grep<cr>", "Search by Grep" },
		d = { "<cmd>Telescope diagnostics<cr>", "Search Diagnostics" },
		k = { "<cmd>Telescope keymaps<cr>", "Search Keymaps" },
	},
}, { prefix = "<leader>" })

-- vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
-- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
-- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
-- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>tk', require('telescope.builtin').keymaps, { desc = '[T]elescope [K]eymaps' })

-- Terminal
vim.keymap.set('n', '<leader>tf', [[<cmd>ToggleTerm size=40 direction=float<cr>]],
	{ desc = '[T]oggle Terminal [F]loat' })
vim.keymap.set('n', '<leader>th', [[<cmd>ToggleTerm size=40 direction=horizontal<cr>]],
	{ desc = '[T]oggle Terminal [H]orizontal' })
vim.keymap.set('n', '<leader>tv', [[<cmd>ToggleTerm size=40 direction=vertical<cr>]],
	{ desc = '[T]oggle Terminal [V]ertical' })

--
-- bufferline.nvim
--

--
-- Moving around
--
vim.keymap.set('n', '<C-d>', '<C-d>zz', { remap = true, silent = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { remap = true, silent = true })

vim.keymap.set('n', 'n', 'nzzzv', { remap = true, silent = true })
vim.keymap.set('n', 'N', 'Nzzzv', { remap = true, silent = true })

-- save
vim.keymap.set('n', '<C-s>', '<cmd>wa<cr>', { silent = true })
vim.keymap.set('i', '<C-s>', '<cmd>wa<cr>', { remap = true, silent = true })
-- vim.keymap.set('i', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')
-- vim.keymap.set('v', '<C-s>', '<cmd>w<cr>', { noremap = true, silent = true })

--
-- INSERT MODE
--
--vim.keymap.set('i', '<C-o>', "<Esc>o", { silent = true })

-- Will set 'jk' or 'jk' to Esc to escape the insert mode.
vim.keymap.set('i', 'jk', "<Esc>", { silent = true })
vim.keymap.set('i', 'kj', "<Esc>", { silent = true })

vim.keymap.set('i', '<C-BS>', "<C-w>", { noremap = true, silent = true, desc = "Delete word" })
vim.keymap.set('n', '<C-_>', 'gcc', { remap = true })
vim.keymap.set('v', '<C-_>', 'gc', { remap = true })

--
--VISUAL MODE
--
vim.keymap.set('v', '<F5>', ":Ray<CR>", { noremap = true, silent = true, desc = "open Ray.so with selected value" })

-- make it so you can move selected lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('x', '<leader>v', "\"_dp")


vim.api.nvim_set_keymap('n', '<A-1>', '<cmd>NeoTreeRevealToggle<CR>', { noremap = false })
