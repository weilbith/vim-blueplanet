packer.use({
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-nvim-lsp',
    'ray-x/cmp-treesitter',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-emoji',
    'hrsh7th/cmp-nvim-lua',
    'andersevenrud/cmp-tmux',
    'petertriho/cmp-git',
    'lukas-reineke/cmp-under-comparator',
    'saadparwaiz1/cmp_luasnip',
  },
	config = 'vim.cmd("packadd cmp")',
})
-- add vcard for mails
-- add signature help
