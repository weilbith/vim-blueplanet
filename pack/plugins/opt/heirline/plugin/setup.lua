local buffer_matches = require('heirline.conditions').buffer_matches
local Breadcrumbs = require('heirline_custom.components.breadcumbs')
local Tests = require('heirline_custom.components.tests')
local Project = require('heirline_custom.components.project')
local Git = require('heirline_custom.components.git')
local Lsp = require('heirline_custom.components.lsp')
local Signs = require('heirline_custom.components.signs')
local Folds = require('heirline_custom.components.folds')
local LineNumber = require('heirline_custom.components.line_number')
local Border = require('heirline_custom.components.border')

local Space = { provider = ' ' }
local Gap = { provider = '%=' }

local status_bar = { Space, Project, Space, Git, Gap, Lsp, Space }
local window_bar = { Space, Breadcrumbs, Gap, Tests, Space }
local status_column = { Space, LineNumber, Space, Border, Folds, Signs }

require('heirline').setup({
  statusline = status_bar,
  winbar = window_bar,
  statuscolumn = status_column,
  opts = {
    disable_winbar_cb = function(args)
      return buffer_matches({
        buftype = { 'help', 'quickfix' },
      }, args.buf) or vim.bo[args.buf].ft == '' or not vim.bo[args.buf].buflisted
    end,
  },
})
