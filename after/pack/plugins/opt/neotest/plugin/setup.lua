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
