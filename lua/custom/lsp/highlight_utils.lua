local vim = vim
local lsp = vim.lsp
local lsp_capabilities = require "custom.lsp.capabilities"

local M = {}

function M.highlight_if_available()
    if lsp_capabilities.client_available() and lsp_capabilities.client_provides_highlighting() then
        lsp.buf.document_highlight()
    end
end

return M
