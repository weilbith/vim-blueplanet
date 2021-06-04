lua packer.use({
      \   'b3nj5m1n/kommentary',
      \   requires = {'JoosepAlviste/nvim-ts-context-commentstring'},
      \   keys = {
      \     '<Plug>kommentary_line_default',
      \     '<Plug>kommentary_visual_default',
      \   },
      \   config = 'vim.cmd("packadd kommentary_config")',
      \ })

" Note: Unfortunately the plugin itself is using its pure name without a pre-
" or postfix. Therefore we must add this ugly '_config'.
