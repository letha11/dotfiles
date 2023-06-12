require('illuminate').configure {};
-- change the highlight style
vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })

--- auto update the highlight style on colorscheme change
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
	pattern = { "*" },
	callback = function(ev)
		vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
		vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
		vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
	end
})
-- vim.cmd('hi IlluminatedWordText guibg=#504945 gui=bold')
-- vim.cmd('hi IlluminatedWordText guibg=#ffffff gui=none')
-- vim.cmd('hi CursorWord guibg=#ffffff gui=none')
-- vim.cmd('hi MiniCursorword guibg=#ffffff gui=none')
-- vim.cmd('hi MiniCursorwordCurrent guibg=#ffffff gui=none')
--
