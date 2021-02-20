scriptencoding utf-8

lua require('gitsigns').setup({
      \   numhl = true,
      \   keymaps = {},
      \   sign_priority = 1,
      \   signs = {
      \     add          = { text = '│', hl = 'GreenBold', numhl = 'Green' },
      \     change       = { text = '│', hl = 'BlueBold', numhl = 'Blue' },
      \     delete       = { text = '│', hl = 'RedBold', numhl = 'Red' },
      \     topdelete    = { text = '│', hl = 'RedBold', numhl = 'Red' },
      \     changedelete = { text = '│', hl = 'OrangeBold', numhl = 'Orange' },
      \     changedelete = { text = '│', hl = 'OrgangeBold', numhl = 'Orange' },
      \   },
      \ })
