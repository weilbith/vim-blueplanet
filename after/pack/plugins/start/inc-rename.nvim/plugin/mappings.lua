require('plugin_manager').load_package_on_command_s('inc-rename.nvim', 'IncRename')

vim.keymap.set('n', 'grN', function()
  local current_name = vim.fn.expand('<cword>')
  vim.cmd('IncRename ' .. current_name)
end, { desc = 'rename target under cursor with preview' })
