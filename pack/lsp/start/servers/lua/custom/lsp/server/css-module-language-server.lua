local build_start_options = require('custom.lsp').build_start_options
local find_root = require('custom.lsp.utilities').find_root
local start_server = require('custom.lsp').start_server

local function containsAnyCSSModuleLoading()
  return vim.api.nvim_buf_call(0, function()
    return vim.fn.search('module.css')
  end) > 0
end

if containsAnyCSSModuleLoading() then
  start_server(build_start_options({
    name = 'CSS-Module Language Server',
    cmd = { 'cssmodules-language-server' },
    root_dir = find_root({ 'package.json' }),
  }))
end
