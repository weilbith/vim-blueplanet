lua packer.use({
      \   'onsails/lspkind-nvim',
      \   event = 'CompleteChanged *',
      \   config = 'vim.cmd("packadd lspkind")',
      \ })

" With the CompleteChanged event this does not work for the very first opened
" completion menu (unless its entries get updated). Though it is still 'better'
" than a less precise event that loads it too early.
