lua packer.use({
    \   'nvim-telescope/telescope.nvim',
    \   requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    \   cmd = 'Telescope',
    \   config = 'vim.cmd("packadd telescope")',
    \ })
