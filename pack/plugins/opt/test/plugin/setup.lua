vim.g['test#strategy'] = {
  nearest = 'floaterm',
  file = 'floaterm',
}

vim.g['test#enabled_runners'] = {
  'python#pytest',
  'typescript#mocha',
  'typescript#jest',
  'rust#cargotest',
  'lua#busted',
}

vim.g['test#custom_runners'] = {
  TypeScript = { 'Mocha', 'Jest' },
}

vim.g['test#python#runner'] = 'pytest'
vim.g['test#python#pytest#options'] = { nearest = '--capture=no' }
