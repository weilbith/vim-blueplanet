packer.use({
  'lukas-reineke/headlines.nvim',
  ft = { 'markdown', 'wimwiki', 'orgmode' },
  config = 'vim.cmd("packadd headlines")',
})
