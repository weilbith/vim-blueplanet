require('packer').use({
  'matze/vim-move',
  keys = {
    '<Plug>MoveLineUp',
    '<Plug>MoveLineDown',
    '<Plug>MoveBlockUp',
    '<Plug>MoveBlockDown',
    '<Plug>MoveBlockRight',
    '<Plug>MoveBlockLeft',
  },
  setup = 'vim.cmd("packadd move")',
})
