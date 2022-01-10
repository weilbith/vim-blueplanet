packer.use({
  'kevinhwang91/nvim-hlslens',
  event = { 'CmdlineEnter /,\\?' },
  setup = function() vim.g.loaded_nvim_hlslens = true end,
  config = 'vim.cmd("packadd hlslens")',
})
