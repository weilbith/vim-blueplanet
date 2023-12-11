local surround = require('heirline.utils').surround
local get_highlight = require('heirline.utils').get_highlight

local running_icon = (vim.api.nvim_call_function('sign_getdefined', { 'neotest_running' })[1] or {}).text
  or ''
local passed_icon = (vim.api.nvim_call_function('sign_getdefined', { 'neotest_passed' })[1] or {}).text
  or ''
local failed_icon = (vim.api.nvim_call_function('sign_getdefined', { 'neotest_failed' })[1] or {}).text
  or ''

local function has_test_cases(buffer_number)
  for _, adapter_identifier in pairs(require('neotest').state.adapter_ids()) do
    local positions = require('neotest').state.positions(
      adapter_identifier,
      { buffer = buffer_number }
    )
    if positions ~= nil then
      return true
    end
  end

  return false
end

local function get_test_case_numbers(buffer_number)
  local running = 0
  local passed = 0
  local failed = 0
  local total = 0

  for _, adapter_identifier in pairs(require('neotest').state.adapter_ids()) do
    local test_case_numbers = require('neotest').state.status_counts(
      adapter_identifier,
      { buffer = buffer_number }
    ) or {}

    running = running + (test_case_numbers.running or 0)
    passed = passed + (test_case_numbers.passed or 0)
    failed = failed + (test_case_numbers.failed or 0)
    total = total + (test_case_numbers.total or 0)
  end

  return { running = running, passed = passed, failed = failed, total = total }
end

local TestBlock = {
  condition = function(self)
    local window_identifier = vim.fn.win_getid(self.winnr)
    self.buffer_number = vim.api.nvim_win_get_buf(window_identifier)
    local neotest_available, _ = pcall(require, 'neotest')
    return neotest_available and has_test_cases(self.buffer_number)
  end,
  init = function(self)
    local test_case_numbers = get_test_case_numbers(self.buffer_number)
    self.running = test_case_numbers.running
    self.passed = test_case_numbers.passed
    self.failed = test_case_numbers.failed
    self.total = test_case_numbers.total
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
        return running_icon .. ' ' .. self.running .. ' '
      end,
      hl = get_highlight('YellowBold'),
    },
    {
      condition = function(self)
        return self.passed > 0
      end,
      provider = function(self)
        return passed_icon .. ' ' .. self.passed .. ' '
      end,
      hl = get_highlight('GreenBold'),
    },
    {
      condition = function(self)
        return self.failed > 0
      end,
      provider = function(self)
        return failed_icon .. ' ' .. self.failed .. ' '
      end,
      hl = get_highlight('RedBold'),
    },
    {
      provider = function(self)
        local output = ''

        if self.running + self.passed + self.failed > 0 then
          output = ' '
        end

        return output .. self.total .. ' Tests '
      end,
      hl = get_highlight('WhiteBold'),
    },
  }),
}

return TestBlock
