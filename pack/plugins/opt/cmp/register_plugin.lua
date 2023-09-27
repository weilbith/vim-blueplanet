require('packer').use({
  'hrsh7th/nvim-cmp',
  requires = {
    { 'hrsh7th/cmp-nvim-lsp', module = 'cmp_nvim_lsp' },
    { 'ray-x/cmp-treesitter', module = 'cmp_treesitter' },
    { 'hrsh7th/cmp-path', module = 'cmp_path' },
    { 'hrsh7th/cmp-buffer', module = 'cmp_buffer' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/cmp-emoji', module = 'cmp_emoji' },
    { 'hrsh7th/cmp-nvim-lua', module = 'cmp_nvim_lua' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help', module = 'cmp_nvim_lsp_signature_help' },
    { 'andersevenrud/cmp-tmux', module = 'cmp_tmux' },
    { 'petertriho/cmp-git', module = 'cmp_git' },
    { 'saadparwaiz1/cmp_luasnip', module = 'cmp_luasnip' },
  },
  config = 'vim.cmd("packadd cmp")',
})
-- add vcard for mails
-- add signature help
