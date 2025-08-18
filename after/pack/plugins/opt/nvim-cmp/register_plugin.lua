require('packer').use({
  'hrsh7th/nvim-cmp',
  requires = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'ray-x/cmp-treesitter' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/cmp-emoji' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'andersevenrud/cmp-tmux' },
    { 'petertriho/cmp-git' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'rcarriga/cmp-dap', opt = true }, -- TODO: Why is this not used?
  },
})
-- add vcard for mails
-- add signature help
