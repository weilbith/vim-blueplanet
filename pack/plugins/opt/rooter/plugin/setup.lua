vim.g.rooter_silent_chdir = 1
vim.g.rooter_targets = '*'
vim.g.rooter_patterns = {
  'package.json',
  'pyproject.toml',
  'Cargo.toml',
  '!.git/worktrees/*',
  '.git',
}
