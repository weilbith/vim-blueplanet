local start_server = require('custom.lsp').start_server
local build_start_options = require('custom.lsp').build_start_options
local find_root = require('custom.lsp.utilities').find_root

start_server(build_start_options({
  name = 'Lua Language Server',
  cmd = { 'lua-language-server' },
  root_dir = find_root({
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
  }),
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          'vim',
          -- Busted - why does it not pick it up from the library?
          'insulate',
          'describe',
          'it',
          'assert',
        },
      },
      runtime = {
        path = { '?.lua', '?/init.lua' },
      },
      format = {
        enable = false,
      },
      hint = {
        enable = true,
        arrayIndex = 'Disable',
        setType = true,
      },
      IntelliSense = {
        traceLocalSet = true,
        traceReturn = true,
        traceBeSetted = true,
        traceFieldInject = true,
      },
      completion = {
        callSnippet = 'Both',
        keywordSnippet = 'Both',
        showParams = false,
      },
    },
  },
}))
