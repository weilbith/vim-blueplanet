packer.use({
  'hrsh7th/nvim-compe',
  requires = {'hrsh7th/vim-vsnip'},
	config = 'vim.cmd("packadd compe")',
})

-- Note: Lazy load on InsertEnter does not work.
