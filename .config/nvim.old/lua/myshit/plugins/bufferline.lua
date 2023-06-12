require('bufferline').setup {
	-- highlights = {
	-- },
	options = {
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
	}
}


vim.keymap.set('n', '<leader>bq', ':bdelete!<cr>', { desc = '[B]uffers [Q]uit' })
vim.keymap.set('n', '<leader>be', '<CMD>BufferLinePick<CR>')
vim.keymap.set('n', '<leader>ts', '<CMD>BufferLinePickClose<CR>')
vim.keymap.set('n', '<leader>bs', '<CMD>BufferLineSortByDirectory<CR>')
vim.keymap.set('n', '<leader>bH', '<CMD>BufferLineCloseLeft<CR>')
vim.keymap.set('n', '<leader>bL', '<CMD>BufferLineCloseRight<CR>')
vim.keymap.set('n', '<S-l>', '<CMD>BufferLineCycleNext<CR>')
vim.keymap.set('n', '<S-h>', '<CMD>BufferLineCyclePrev<CR>')
vim.keymap.set('n', ']b', '<CMD>BufferLineMoveNext<CR>')
vim.keymap.set('n', '[b', '<CMD>BufferLineMovePrev<CR>')
