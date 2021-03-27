lua packer.use({
      \   'janko/vim-test',
      \   cmd = { 'TestNearest', 'TestFile', 'TestSuite', 'TestLast', 'TestVisit' },
      \   config = 'vim.cmd("packadd test")',
      \ })
