local lsp = require "vim.lsp"
local lsp_methods = require "custom.lsp.methods"

local M = {}

M[lsp_methods.definition] = lsp.callbacks[lsp_methods.definition]
M[lsp_methods.references] = lsp.callbacks[lsp_methods.references]
M[lsp_methods.rename] = lsp.callbacks[lsp_methods.rename]
M[lsp_methods.peekDefinition] = lsp.callbacks[lsp_methods.peekDefinition]

return M
