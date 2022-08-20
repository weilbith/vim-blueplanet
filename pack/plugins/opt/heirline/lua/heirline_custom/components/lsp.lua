local language_server_is_attached = require('heirline.conditions').lsp_attached
local surround = require('heirline.utils').surround
local get_highlight = require('heirline.utils').get_highlight

local LspBlock = {
  condition = language_server_is_attached,
  update = { 'LspAttach', 'LspDetach' },
  surround({ '', '' }, function()
    return get_highlight('GreyBackgroundContrast').bg
  end, {
    {
      provider = function()
        return #vim.lsp.buf_get_clients(0) .. ' Servers'
      end,
    },
  }),
}

return LspBlock
