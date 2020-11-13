lua << EOF
local rename_handler = require'lsp_handlers.rename'
vim.lsp.handlers["textDocument/rename"] = renameHandler
EOF
