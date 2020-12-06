scriptencoding utf-8

lua <<EOF
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GreenBold', text = '│'},
    change       = {hl = 'BlueBold', text = '│'},
    delete       = {hl = 'RedBold', text = '│'},
    topdelete    = {hl = 'RedBold', text = '│'},
    changedelete = {hl = 'OrangeBold', text = '│'},
  },
  keymaps = {},
  sign_priority = 1,
}
EOF
