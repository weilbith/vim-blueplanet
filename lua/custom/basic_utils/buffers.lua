local vim = vim
local api = vim.api

local M = {}

function M.save_buffer_in_background(buffer_number)
    local buffer_lines = api.nvim_buf_get_lines(buffer_number, 0, -1, 1)
    local absolute_file_path = api.nvim_buf_get_name(buffer_number)
    api.nvim_call_function("writefile", {buffer_lines, absolute_file_path})
    api.nvim_buf_set_option(buffer_number, "modified", false)
end

function M.get_modified_buffers()
    local modified_buffers = {}

    for _, buffer_number in ipairs(api.nvim_list_bufs()) do
        if api.nvim_buf_get_option(buffer_number, "modified") then
            table.insert(modified_buffers, buffer_number)
        end
    end

    return modified_buffers
end

function M.get_buffer_names(buffer_list)
    local buffer_names = {}

    for _, buffer_number in ipairs(buffer_list) do
        local buffer_name = api.nvim_buf_get_name(buffer_number)
        table.insert(buffer_names, buffer_name)
    end

    return buffer_names
end

return M
