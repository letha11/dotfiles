local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  --php
  -- b.formatting.phpcsfixer.with { filetypes = { "php" } },
  b.formatting.phpcsfixer,
  b.diagnostics.php,

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  b.formatting.dart_format,

  -- Python
  b.diagnostics.mypy,
  b.diagnostics.ruff,
  b.formatting.black
}

null_ls.setup {
  debug = true,
  sources = sources,
}
