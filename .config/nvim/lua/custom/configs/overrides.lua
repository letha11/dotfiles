local cmp = require("cmp")
local M = {}

M.telescope = {
  defaults = {
    -- sorting_strategy = "ascending",
    -- path_display = { truncate = 1 },
    path_display = function(opts, path)
      local tail = require("telescope.utils").path_tail(path)
      return string.format("%s (%s)", tail, path)
    end,
    file_ignore_patterns = { "node_modules", "android", "ios", "vendor" },
  },
}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "php",
  },
  indent = {
    enable = false,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- python
    "pyright",
    "mypy",
    "ruff",
    "black", -- formatter
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.cmp = {
  mapping = {
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() and cmp.get_active_entry() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
        else
          fallback()
        end
      end,
      s = cmp.mapping.confirm({ select = true }),
      c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    }),
    ["<Tab>"] = cmp.mapping.confirm({ select = false }),
  },
}

-- M.luasnip = function(opts)
--   require("luasnip").config.set_config(opts)
--
--   -- vscode format
--   require("luasnip.loaders.from_vscode").lazy_load()
--   require("luasnip.loaders.from_vscode").lazy_load { paths = vim.g.vscode_snippets_path or "" }
--
--   -- snipmate format
--   require("luasnip.loaders.from_snipmate").load()
--   require("luasnip.loaders.from_snipmate").lazy_load { paths = vim.g.snipmate_snippets_path or "" }
--
--   -- lua format
--   require("luasnip.loaders.from_lua").load()
--   require("luasnip.loaders.from_lua").lazy_load { paths = vim.g.lua_snippets_path or "" }
--
--   require('luasnip').filetype_extend("javascriptreact", { "html" })
--   -- require("luasnip/loaders/from_vscode").lazy_load()
--
--   vim.api.nvim_create_autocmd("InsertLeave", {
--     callback = function()
--       if
--         require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
--         and not require("luasnip").session.jump_active
--       then
--         require("luasnip").unlink_current()
--       end
--     end,
--   })
-- end

M.comment = {
  -- pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}
-- M.blankline = {
-- 	show_current_context_start = false, -- disable annoying highlight on function while the cursor inside the function body
-- }

return M
