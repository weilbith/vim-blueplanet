local vim = vim
local api = vim.api

local M = {}

function M.user_confirm(message)
    local options = "&Yes\n&Cancel"
    local option_index_yes = 1
    local option_index_cancel = 2
    local choice = api.nvim_call_function("confirm", {message, options, option_index_cancel})
    return choice == option_index_yes
end

return M
