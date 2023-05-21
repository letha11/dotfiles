local cmp = require('cmp')
local luasnip = require('luasnip')

local unlinkgrp = vim.api.nvim_create_augroup(
  'UnlinkSnippetOnModeChange',
  { clear = true }
)

vim.api.nvim_create_autocmd('ModeChanged', {
  group = unlinkgrp,
  pattern = { 's:n', 'i:*' },
  desc = 'Forget the current snippet when leaving the insert mode',
  callback = function(evt)
    -- If we have n active nodes, n - 1 will still remain after a `unlink_current()` call.
    -- We unlink all of them by wrapping the calls in a loop.
    while true do
      if luasnip.session and luasnip.session.current_nodes[evt.buf] and not luasnip.session.jump_active then
        luasnip.unlink_current()
      else
        break
      end
    end
  end,
})

-- snippets
luasnip.config.setup {}
require("luasnip.loaders.from_snipmate").lazy_load()

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    name = 'buffer'
  }),
}

-- Configuring 'autopairs' with 'cmp'
local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
local handlers = require 'nvim-autopairs.completion.handlers'
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done(
    {
      filetypes = {
        -- "*" is a alias to all filetypes
        ["*"] = {
          ["("] = {
            kind = {
              cmp.lsp.CompletionItemKind.Function,
              cmp.lsp.CompletionItemKind.Method,
            },
            handler = handlers["*"]
          }
        },
        lua = {
          ["("] = {
            kind = {
              cmp.lsp.CompletionItemKind.Function,
              cmp.lsp.CompletionItemKind.Method
            },
            ---@param char string
            ---@param item table item completion
            ---@param bufnr number buffer number
            ---@param rules table
            ---@param commit_character table<string>
            handler = function(char, item, bufnr, rules, commit_character)
              -- Your handler function. Inpect with print(vim.inspect{char, item, bufnr, rules, commit_character})
            end
          }
        },
        -- Disable for tex
        tex = false
      }
    }
  )
)
