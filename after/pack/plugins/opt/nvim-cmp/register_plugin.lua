require('packer').use({ 'hrsh7th/nvim-cmp' })
-- add vcard for mails
-- add signature help

-- Dependencies
require('packer').use({ 'hrsh7th/cmp-nvim-lsp' })
require('packer').use({ 'ray-x/cmp-treesitter' })
require('packer').use({ 'hrsh7th/cmp-path' })
require('packer').use({ 'hrsh7th/cmp-buffer' })
require('packer').use({ 'hrsh7th/cmp-cmdline' })
require('packer').use({ 'hrsh7th/cmp-emoji' })
require('packer').use({ 'hrsh7th/cmp-nvim-lua' })
require('packer').use({ 'hrsh7th/cmp-nvim-lsp-signature-help' })
require('packer').use({ 'andersevenrud/cmp-tmux' })
require('packer').use({ 'petertriho/cmp-git' })
require('packer').use({ 'saadparwaiz1/cmp_luasnip' })
require('packer').use({ 'rcarriga/cmp-dap', opt = true } --[[ TODO: Why is this not used ]])
