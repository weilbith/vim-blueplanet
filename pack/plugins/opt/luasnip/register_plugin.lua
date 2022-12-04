require('packer').use({
  'L3MON4D3/LuaSnip',
  event = 'InsertEnter',
  module = 'luasnip',
  cmd = 'LuaSnipEdit',
  config = 'vim.cmd("packadd luasnip")',
})
