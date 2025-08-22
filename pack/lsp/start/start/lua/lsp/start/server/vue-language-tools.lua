return function()
  require('lsp.start')({
    name = 'Vue Language Tools',
    cmd = { 'vue-language-server', '--stdio' },
    root_dir = vim.fs.root(0, 'package.json'),
    init_options = {
      typescript = {
        tsdk = vim.fs.joinpath(vim.fs.root(0, 'node_modules'), '/node_modules/typescript/lib'),
      },
    },
  })
end
