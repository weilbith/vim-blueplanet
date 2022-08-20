local buffer_matches = require('heirline.conditions').buffer_matches
local pick_child_on_condition = require('heirline.utils').pick_child_on_condition

local Breadcrumbs = require('heirline_custom.components.breadcumbs')
local Tests = require('heirline_custom.components.tests')
local Project = require('heirline_custom.components.project')
local Git = require('heirline_custom.components.git')
local Lsp = require('heirline_custom.components.lsp')

local WinBars = {
  init = pick_child_on_condition,
  {
    condition = function()
      local window_configuration = vim.api.nvim_win_get_config(0)
      local is_floating_window = window_configuration.relative ~= ''

      if is_floating_window then
        return false
      else
        return buffer_matches({
          buftype = { 'nofile', 'prompt', 'help', 'quickfix' },
          filetype = {
            '^git.*',
            'fugitive',
            'floaterm',
            'TelescopePrompt',
            'neo-tree',
            'neo-tree-popup',
          },
        })
      end
    end,
    provider = '',
  },
  {
    { provider = ' ' },
    Breadcrumbs,
    { provider = '%=' },
    Tests,
    { provider = ' ' },
  },
}

local StatusBar = {
  init = pick_child_on_condition,
  {
    condition = function()
      local window_configuration = vim.api.nvim_win_get_config(0)
      local is_floating_window = window_configuration.relative ~= ''

      if is_floating_window then
        return false
      else
        return buffer_matches({
          buftype = { 'nofile', 'prompt', 'help', 'quickfix' },
          filetype = {
            '^git.*',
            'fugitive',
            'floaterm',
            'TelescopePrompt',
            'neo-tree',
            'neo-tree-popup',
          },
        })
      end
    end,
    provider = '',
  },
  {
    { provider = ' ' },
    Project,
    { provider = ' ' },
    Git,
    { provider = '%=' },
    Lsp,
    { provider = ' ' },
  },
}

require('heirline').setup(StatusBar, WinBars)
