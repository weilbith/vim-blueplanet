-- local check_npm_dependency = require('custom.lsp.utilities').check_npm_dependency
local build_start_options = require('custom.lsp').build_start_options
local find_root = require('custom.lsp.utilities').find_root

local function start_typescript_server()
  -- TODO: Should I use `vtsls`?
  vim.lsp.start(build_start_options(vim.bo[0].ft, {
    name = 'TypeScript Language Server',
    cmd = { 'typescript-language-server', '--stdio' },
    root_dir = find_root({
      'tsconfig.json',
      'package.json',
      '.git',
    }),
    capabilities = {
      workspace = {
        fileOperations = {
          willCreate = true,
          willRename = true,
          willDelete = true,
        },
      },
    },
    settings = {
      completions = {
        completeFunctionCalls = true,
      },
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  }))
end

-- local function start_vue_server()
--   vim.cmd('runtime! ftplugin/vue_server.lua')
-- end

-- check_npm_dependency('vue', start_vue_server, start_typescript_server)
start_typescript_server()
