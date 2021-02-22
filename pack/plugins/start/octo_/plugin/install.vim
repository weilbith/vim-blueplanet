lua packer.use({
    \   'pwntester/octo.nvim',
    \   requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope.nvim'}},
    \   cmd = { 'Octo' },
    \   config = 'vim.cmd("packadd octo")',
    \ })
