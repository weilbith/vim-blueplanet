packer.use({
  'janko/vim-test',
  cmd = { 'TestNearest', 'TestFile', 'TestSuite', 'TestLast', 'TestVisit' },
  fn = 'test#*',
  config = 'vim.cmd("packadd test")',
})
