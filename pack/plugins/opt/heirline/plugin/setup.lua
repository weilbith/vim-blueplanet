local buffer_matches = require('heirline.conditions').buffer_matches
local Breadcrumbs = require('heirline_custom.components.breadcumbs')
local Tests = require('heirline_custom.components.tests')
local Project = require('heirline_custom.components.project')
local Git = require('heirline_custom.components.git')
local Lsp = require('heirline_custom.components.lsp')

local Space = { provider = ' ' }
local Gap = { provider = '%=' }

local status_bar = { Space, Project, Space, Git, Gap, Lsp, Space }
local window_bar = { Space, Breadcrumbs, Gap, Tests, Space }

require('heirline').setup({
  statusline = status_bar,
  winbar = window_bar,
  opts = {
    disable_winbar_cb = function(args)
      return buffer_matches({
        buftype = { 'help', 'quickfix' },
        filetype = { 'Navbuddy', '' },
      }, args.buf)
    end,
  },
})
