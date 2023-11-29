local git_signs = require('gitsigns')
local escape_and_feed_keys = require('custom.utils').escape_and_feed_keys

local function get_visual_range()
  local current_line = vim.fn.line('.')
  local selection_start_line = vim.fn.line('v')
  return { current_line, selection_start_line }
end

local function compose_functions(g, f)
  return function()
    g(f())
  end
end

vim.keymap.set('n', '<leader>gm', git_signs.blame_line, {})
vim.keymap.set('n', '<leader>ghh', git_signs.preview_hunk_inline, {})

vim.keymap.set('n', '<leader>ghs', git_signs.stage_hunk, {})
vim.keymap.set('v', '<leader>gs', compose_functions(git_signs.stage_hunk, get_visual_range), {})
vim.keymap.set('n', '<leader>gS', git_signs.stage_buffer, {})

vim.keymap.set('n', '<leader>ghr', git_signs.reset_hunk, {})
vim.keymap.set('v', '<leader>gr', compose_functions(git_signs.reset_hunk, get_visual_range), {})
vim.keymap.set('n', '<leader>gR', git_signs.reset_buffer, {})

vim.keymap.set({ 'v', 'o', 'x' }, 'ih', git_signs.select_hunk, {})

vim.keymap.set('n', ']c', function()
  if vim.wo.diff then
    escape_and_feed_keys(']c', 'n')
  else
    git_signs.next_hunk()
  end
end, {})

vim.keymap.set('n', '[c', function()
  if vim.wo.diff then
    escape_and_feed_keys('[c', 'n')
  else
    git_signs.prev_hunk()
  end
end, {})
