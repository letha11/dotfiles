---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "gruvbox",
  theme_toggle = { "gruvbox", "one_light" },
  -- hl_override = {
  --   CursorLine = {
  --     bg="white",
  --   },
  -- },
  transparency = true,

  -- tabufline = { 
  --   overriden_modules = function ()
  --   end,
  --   -- overriden_modules = function()
  --   --    local modules = require "nvchad_ui.tabufline.modules"
  --   --
  --   --    return {
  --   --      buttons = function()
  --   --        return modules.buttons() .. " my button "
  --   --      end,
  --   --      -- or buttons = "" , this will hide the buttons
  --   --    }
  --   -- end,
  -- },

  tabufline = {
    enabled = false,
    -- overriden_modules = function ()
    --    local modules = require "nvchad_ui.tabufline.modules"
    --
    --    return {
    --      buttons = function()
    --        return modules.buttons() .. " my button "
    --      end,
    --      -- or buttons = "" , this will hide the buttons
    --    }
    -- end,
  },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
