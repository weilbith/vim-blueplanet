packer.use({
  'danymat/neogen',
  requires = { 'nvim-treesitter/nvim-treesitter' },
  cmd = 'Neogen',
  config = 'vim.cmd("packadd neogen_config")',
})

-- Note: Unfortunately the plugin itself is using its pure name without a pre-
-- or postfix. Therefore we must add this ugly '_config'.
