local null_ls = require("null-ls");

local sources = {
	null_ls.builtins.formatting.prettierd.with({
		filetypes = {
			"javascript",
			"typescript",
			"css",
			"scss",
			"html",
			"json",
			"yaml",
			"markdown",
			"graphql",
			"md",
			"txt",
		},
		args = { "--tab-width", "2" },
	}),
	null_ls.builtins.formatting.stylua.with({
		filetypes = {
			"lua",
		},
		args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
	}),
	null_ls.builtins.diagnostics.stylelint.with({
		filetypes = {
			"css",
			"scss",
		},
	}),

}

null_ls.setup({
	sources = sources,
})
