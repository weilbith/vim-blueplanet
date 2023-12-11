local surround = require('heirline.utils').surround
local get_highlight = require('heirline.utils').get_highlight
local get_shell_output = require('heirline_custom.utils').get_shell_output

local GitBranch = {
  condition = function()
    return vim.g.gitsigns_head ~= nil
  end,
  surround({ '', '' }, function()
    return get_highlight('PurpleBackgroundContrast').bg
  end, {
    init = function(self)
      self.branch_name = vim.g.gitsigns_head
      self.remote_name = get_shell_output(
        'git for-each-ref --format="%(upstream:remotename)" "refs/heads/$(git branch --show-current)"'
      )
    end,
    provider = function(self)
      local output = ' '

      if self.remote_name and #self.remote_name > 0 then
        output = output .. ' ' .. self.remote_name .. ' '
      end

      output = output .. '  ' .. vim.fn.substitute(self.branch_name, '/', '  ', 'g')
      output = output .. ' '
      return output
    end,
    hl = get_highlight('PurpleBackgroundContrast'),
  }),
}

return GitBranch
