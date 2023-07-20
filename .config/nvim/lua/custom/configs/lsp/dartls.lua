local lspconfig = require("lspconfig");
local util = lspconfig.util

local cmd = (
	vim.fn.has("win32") == 1 and { "cmd.exe", "/C", "dart", "language-server", "--protocol=lsp" }
	or { "dart", "language-server", "--protocol=lsp" }
)

-- lspconfig.dartls.setup({
-- 	on_attach = require("plugins.configs.lspconfig").on_attach,
-- 	capabilities = require("plugins.configs.lspconfig").capabilities,
-- 	default_config = {
-- 		cmd = cmd,
-- 		filetypes = { "dart" },
-- 		root_dir = util.root_pattern("pubspec.yaml"),
-- 		init_options = {
-- 			onlyAnalyzeProjectsWithOpenFiles = true,
-- 			suggestFromUnimportedLibraries = true,
-- 			closingLabels = true,
-- 			outline = true,
-- 			flutterOutline = true,
-- 			-- outline = false,
-- 			-- flutterOutline = false,
-- 		},
-- 		settings = {
-- 			dart = {
-- 				completeFunctionCalls = true,
-- 				showTodos = true,
-- 			},
-- 		},
-- 	},
-- 	docs = {
-- 		description = [[
-- https://github.com/dart-lang/sdk/tree/master/pkg/analysis_server/tool/lsp_spec
-- Language server for dart.
-- ]],
-- 		default_config = {
-- 			root_dir = [[root_pattern("pubspec.yaml")]],
-- 		},
-- 	},
-- })
