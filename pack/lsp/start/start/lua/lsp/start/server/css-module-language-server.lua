local function containsAnyCSSModuleLoading()
  return vim.api.nvim_buf_call(0, function()
    return vim.fn.search('module.css')
  end) > 0
end

return function()
  if containsAnyCSSModuleLoading() then
    require("lsp.start")({
      name = 'CSS-Module Language Server',
      cmd = { 'cssmodules-language-server' },
      root_dir = require('lsp.start.utilities').find_root({ 'package.json' }),
    })
  end
end
