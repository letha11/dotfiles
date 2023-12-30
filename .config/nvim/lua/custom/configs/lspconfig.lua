local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

-- if you just want default config for the servers then put them in a table
-- local servers = { "html", "cssls", "tsserver", "clangd", "phpactor" }
local servers = { "html", "cssls", "tsserver", "clangd", "pyright" }

for _, lsp in ipairs(servers) do
	if lsp == "clangd" or lsp == "cssls" then
		capabilities.offsetEncoding = { "utf-16" }
	end
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

require("custom.configs.lsp")

-- require('custom.configs.flutter-tools');

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	-- settings = {
	-- 	pyright = {
	-- 		autoImportCompletion = true,
	-- 	},
	-- 	python = {
	-- 		analysis = {
	-- 			autoSearchPaths = true,
	-- 			diagnosticMode = "openFilesOnly",
	-- 			useLibraryCodeForTypes = true,
	-- 			typeCheckingMode = "off",
	-- 		},
	-- 	},
	-- },
	-- single_file_support = true,
	settings = {
		pyright = {
			disableLanguageServices = false,
			disableOrganizeImports = false,
		},
		python = {
			analysis = {
				autoImportCompletions = true,
				autoSearchPaths = true,
				diagnosticMode = "workspace", -- openFilesOnly, workspace
				typeCheckingMode = "basic", -- off, basic, strict
				useLibraryCodeForTypes = true,
				-- stubPath = vim.fn.stdpath("data") .. "/lazy/python-type-stubs",
			},
		},
	},
})

lspconfig.phpactor.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "phpactor", "language-server" },
	root_dir = function(startPath)
		-- print("root_dir running") -- just to confirm this works; it does.
		local rp = (require("lspconfig.util")).root_pattern
		for _, pattern in pairs({ ".thisIsDocRoot", "index.php", ".git", "composer.json" }) do
			local found = rp({ pattern })(startPath)
			if found and found ~= "" then
				return found
			end
		end
		return nil
	end,
})

-- lspconfig.intelephense.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	root_dir = function(startPath)
-- 		local rp = (require("lspconfig.util")).root_pattern
-- 		for _, pattern in pairs({ ".thisIsDocRoot", "index.php", ".git", "composer.json" }) do
-- 			local found = rp({ pattern })(startPath)
-- 			if found and found ~= "" then
-- 				return found
-- 			end
-- 		end
-- 		return nil
-- 	end,
-- })
