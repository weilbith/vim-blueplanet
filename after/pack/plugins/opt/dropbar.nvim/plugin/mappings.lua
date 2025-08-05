vim.keymap.set('n', '<leader>tb', function()
  require('dropbar.api').pick()
end, { desc = 'show markers in all breadcrumbs menu to pick from' })
