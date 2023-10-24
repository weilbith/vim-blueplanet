vim.api.nvim_set_keymap('n', ']d', '', { callback = vim.diagnostic.goto_next })
vim.api.nvim_set_keymap('n', '[d', '', { callback = vim.diagnostic.goto_prev })
vim.api.nvim_set_keymap('n', '[D', '', { callback = vim.diagnostic.open_float })
