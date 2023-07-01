local surround = require('heirline.utils').surround
local get_highlight = require('heirline.utils').get_highlight

local TestBlock = {
  condition = function()
    -- local ok, result = pcall(vim.api.nvim_call_function, 'ultest#is_test_file', {})
    -- return ok and result > 0
    return false
  end,
  init = function(self)
    local status = vim.api.nvim_call_function('ultest#status', {})
    self.running = status.running
    self.passed = status.passed
    self.failed = status.failed
    self.tests = 0

    for _, entry in pairs(vim.b.ultest_tests or {}) do
      if entry.type == 'test' then
        self.tests = self.tests + 1
      end
    end
  end,
  surround({ '', '' }, function()
    return get_highlight('GreyBackgroundContrast').bg
  end, {
    {
      provider = ' ',
    },
    {
      condition = function(self)
        return self.running > 0
      end,
      provider = function(self)
        return vim.g.ultest_running_sign .. ' ' .. self.running .. ' '
      end,
      hl = get_highlight('YellowBold'),
    },
    {
      condition = function(self)
        return self.passed > 0
      end,
      provider = function(self)
        return vim.g.ultest_pass_sign .. ' ' .. self.passed .. ' '
      end,
      hl = get_highlight('GreenBold'),
    },
    {
      condition = function(self)
        return self.failed > 0
      end,
      provider = function(self)
        return vim.g.ultest_fail_sign .. ' ' .. self.failed .. ' '
      end,
      hl = get_highlight('RedBold'),
    },
    {
      provider = function(self)
        local output = ''

        if self.running + self.passed + self.failed > 0 then
          output = ' '
        end

        output = output .. self.tests .. ' Tests '
        return output
      end,
      hl = get_highlight('WhiteBold'),
    },
  }),
}

return TestBlock
