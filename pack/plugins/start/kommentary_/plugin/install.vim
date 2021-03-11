lua packer.use({
      \   'b3nj5m1n/kommentary',
      \   keys = {
      \     '<Plug>kommentary_line_increase',
      \     '<Plug>kommentary_visual_increase',
      \     '<Plug>kommentary_line_decrease',
      \     '<Plug>kommentary_visual_decrease',
      \   },
      \   config = 'vim.cmd("packadd kommentary_config")',
      \ })

" Note: Unfortunately the plugin itself is using its pure name without a pre-
" or postfix. Therefore we must add this ugly '_config'.
