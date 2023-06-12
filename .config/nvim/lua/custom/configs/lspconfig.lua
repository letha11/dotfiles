local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "phpactor" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.phpactor.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "phpactor", "language-server", "-vvv" },
  root_dir = function(startPath)
    print "root_dir running" -- just to confirm this works; it does.
    local rp = (require "lspconfig.util").root_pattern
    for _, pattern in pairs { ".thisIsDocRoot", "index.php", ".git", "composer.json" } do
      local found = rp { pattern }(startPath)
      if found and found ~= "" then
        return found
      end
    end
    return nil
  end,
}

lspconfig.intelephense.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function(startPath)
    local rp = (require "lspconfig.util").root_pattern
    for _, pattern in pairs { ".thisIsDocRoot", "index.php", ".git", "composer.json" } do
      local found = rp { pattern }(startPath)
      if found and found ~= "" then
        return found
      end
    end
    return nil
  end,
}

-- lspconfig.pyright.setup { blabla}
