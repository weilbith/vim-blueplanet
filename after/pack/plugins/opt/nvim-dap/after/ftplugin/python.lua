require('dap').adapters[vim.bo[0].ft] = {
  type = 'executable',
  command = 'python',
  args = { '-m', 'debugpy.adapter' },
  options = {
    source_filetype = 'python',
  },
}
