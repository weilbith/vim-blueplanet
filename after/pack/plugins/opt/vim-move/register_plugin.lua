require('packer').use({
  'matze/vim-move',
  keys = {
    '<Plug>MoveLineUp',
    '<Plug>MoveLineDown',
    '<Plug>MoveBlockUp',
    '<Plug>MoveBlockDown',
  },
  setup = function()
    vim.g.move_map_keys = false
  end,
})
