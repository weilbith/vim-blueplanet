packer.use({
  'ray-x/lsp_signature.nvim',
  config = 'vim.cmd("packadd lsp-signature")',
})

-- Unfortunately is lazy loading not really possible with this plugin.
