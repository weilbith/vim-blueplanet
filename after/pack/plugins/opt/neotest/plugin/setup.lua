vim.cmd.packadd('plenary.nvim')
vim.cmd.packadd('FixCursorHold.nvim')
vim.cmd.packadd('nvim-nio')
-- TODO: How to load and register adapter on filetype?
vim.cmd.packadd('neotest-gradle')
vim.cmd.packadd('neotest-vitest')
vim.cmd.packadd('neotest-rust')
vim.cmd.packadd('neotest-go')
vim.cmd.packadd('neotest-jest')
vim.cmd.packadd('neotest-python')
vim.cmd.packadd('neotest-playwright')

require('neotest').setup({
  adapters = {
    require('neotest-gradle'),
    require('neotest-vitest'),
    require('neotest-rust'),
    require('neotest-go'),
    require('neotest-jest')({
      jestCommand = 'npm exec -- jest',
    }),
    require('neotest-python'),
    require('neotest-playwright').adapter({
      options = {
        persist_project_selection = true,
        enable_dynamic_test_discovery = true,
      },
    }),
  },
  consumers = {
    playwright = require('neotest-playwright.consumers').consumers,
  },
  icons = {
    failed = '',
    passed = '',
    running = '',
    skipped = '',
    unknown = '',
    expanded = '┬',
    final_child_prefix = '└',
    running_animated = { '◜', '◠', '◝', '◞', '◡', '◟' },
  },
  status = {
    signs = true,
  },
  floating = {
    border = 'single',
  },
  diagnostic = {
    severity = 1,
  },
  quickfix = {
    enabled = false,
  },
})
