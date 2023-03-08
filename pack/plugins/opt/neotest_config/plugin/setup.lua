require('neotest').setup({
  adapters = {
    require('neotest-vitest'),
    require('neotest-rust'),
    require('neotest-jest')({
      jestCommand = 'npm exec -- jest',
    }),
    require('neotest-python'),
    require('neotest-vim-test')({
      ignore_filetypes = { 'rust', 'python', 'typescript', 'javascript', 'vue' },
    }),
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
    boarder = 'single',
  },
  diagnostic = {
    severity = 2,
  },
  quickfix = {
    enabled = false,
  },
})
