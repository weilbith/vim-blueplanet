local vim = vim
local api = vim.api
local lsp = vim.lsp

local M = {}

function M.highlight_if_available()
    -- TODO: Make this more proper and check the servers capabilites
    local buffer_number = api.nvim_get_current_buf()
    local filetype = api.nvim_buf_get_option(buffer_number, "filetype")

    if filetype ~= "vim" then
        lsp.buf.document_highlight()
    end
end

return M
