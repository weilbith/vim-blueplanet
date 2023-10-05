require('dap').adapters.python = {
  type = 'executable',
  command = 'python',
  args = { '-m', 'debugpy.adapter' },
  options = {
    source_filetype = 'python',
  },
}
