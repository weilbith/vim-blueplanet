require('packer').use({
  'L3MON4D3/LuaSnip',
  event = 'InsertEnter',
  module = 'luasnip',
  config = 'vim.cmd("packadd luasnip")',
})
