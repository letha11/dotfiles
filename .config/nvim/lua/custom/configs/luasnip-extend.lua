luasnip = require('luasnip')
luasnip.filetype_extend("javascriptreact", { "html" })
require("luasnip/loaders/from_vscode").lazy_load()
