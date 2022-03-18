if vim.g.indentLine_fileTypeExclude ~= nil then
  table.insert(vim.g.indentLine_fileTypeExclude, 'NvimTree')
end

-- TODO: check when these options get available in the setup function.
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_highlight_opened_files = 2
vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 0,
}

vim.g.nvim_tree_icons = {
  default = '',
  git = {
    unstaged = '',
    staged = '',
    unmerged = '',
    renamed = '',
    untracked = '',
    deleted = '',
  },
}

require('nvim-tree').setup({
  update_focused_file = {
    enable = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  git = {
    enable = true,
    ignore = false,
  },
  actions = {
    open_file = {
      window_picker = {
        chars = { 'fjdksla;eiwo' },
      },
    },
  },
  filters = {
    custom = {
      '.git',
      'node_modules',
      '*.aux',
      '*bbl',
      '*.blg',
      '*.dvi',
      '*.fls',
      '*.out',
      '*.log',
      '*.fdb_latexmk',
      '*.pdf',
      '*.tern-port',
      '__pycache__',
      '.mypy_cache',
      '.pytest_cache',
      '.egg-info',
    },
  },
})
