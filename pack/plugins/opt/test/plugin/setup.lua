vim.g['test#strategy'] = {
  nearest = 'floaterm',
  file = 'floaterm',
}

vim.g['test#enabled_runners'] = {
  'python#pytest',
  'typescript#mocha',
  'typescript#jest',
  'typescript#vitest',
  'rust#cargotest',
  'lua#busted',
  'java#maventest',
  'java#gradletest',
  'kotlin#gradletest',
}

vim.g['test#custom_runners'] = {
  TypeScript = { 'Mocha', 'Jest', 'Vitest' },
}

vim.g['test#python#runner'] = 'pytest'
vim.g['test#python#pytest#options'] = { nearest = '--capture=no' }
