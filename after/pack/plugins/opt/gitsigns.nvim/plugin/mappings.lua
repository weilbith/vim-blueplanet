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

vim.keymap.set(
  'n',
  '<leader>gm',
  git_signs.blame_line,
  { desc = 'show/blame git commit for line under cursor' }
)

vim.keymap.set(
  'n',
  '<leader>ghd',
  git_signs.preview_hunk_inline,
  { desc = 'preview the diff of the git hunk under the cursor' }
)

vim.keymap.set(
  'n',
  '<leader>ghs',
  git_signs.stage_hunk,
  { desc = 'stage the current git change hunk under the cursor' }
)

vim.keymap.set(
  'v',
  '<leader>gs',
  compose_functions(git_signs.stage_hunk, get_visual_range),
  { desc = 'stage the selected git changes' }
)

vim.keymap.set(
  'n',
  '<leader>gS',
  git_signs.stage_buffer,
  { desc = 'stage the whole buffer with all git changes' }
)

vim.keymap.set('n', '<leader>ghr', git_signs.reset_hunk, {
  desc = 'reset the git change hunk under the cursor',
})

vim.keymap.set('v', '<leader>gr', compose_functions(git_signs.reset_hunk, get_visual_range), {
  desc = 'reset the selected git changes',
})

vim.keymap.set(
  'n',
  '<leader>gR',
  git_signs.reset_buffer,
  { desc = 'reset the whole buffer with all git changes' }
)

vim.keymap.set(
  { 'v', 'o', 'x' },
  'ih',
  git_signs.select_hunk,
  { desc = 'select range of surrounding git change hunk' }
)

vim.keymap.set('n', ']c', function()
  if vim.wo.diff then
    escape_and_feed_keys(']c', 'n')
  else
    git_signs.nav_hunk('next')
  end
end, {
  desc = 'jump to next git change hunk',
})

vim.keymap.set('n', '[c', function()
  if vim.wo.diff then
    escape_and_feed_keys('[c', 'n')
  else
    git_signs.nav_hunk('prev')
  end
end, {
  desc = 'jump to previous git change hunk',
})
