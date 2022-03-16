vim.g.completion_menu_is_open_function = function()
    return require('cmp').visible()
end

vim.g.completion_menu_entry_is_selected_function = function()
    return require('cmp').get_selected_entry() ~= nil
end
