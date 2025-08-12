local function smoothie_do(unescaped_key_sequence)
  local escaped_key_sequence =
    vim.api.nvim_replace_termcodes(unescaped_key_sequence, true, false, true)
  vim.call('smoothie#do', escaped_key_sequence)
end

vim.keymap.set('n', '<C-D>', function()
  smoothie_do('<C-D>')
end, { desc = 'scroll down in window smoothly (see :help CTRL-D)' })

vim.keymap.set('n', '<C-U>', function()
  smoothie_do('<C-U>')
end, { desc = 'scroll up in window smoothly (see :help CTRL-U)' })

vim.keymap.set('n', '<C-F>', function()
  smoothie_do('<C-F>')
end, { desc = 'scroll page down in window smoothly (see :help CTRL-F)' })

vim.keymap.set('n', '<C-B>', function()
  smoothie_do('<C-B>')
end, { desc = 'scroll page up in window smoothly (see :help CTRL-B)' })
