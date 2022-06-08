if vim.g.indentLine_fileTypeExclude ~= nil then
  table.insert(vim.g.indentLine_fileTypeExclude, 'NvimTree')
end

require('nvim-tree').setup({
  update_focused_file = {
    enable = true,
  },
  diagnostics = {
    enable = false,
  },
  git = {
    enable = true,
    ignore = false,
  },
  actions = {
    open_file = {
      window_picker = {
        chars = 'fjdksla;eiwo',
      },
    },
  },
  renderer = {
    highlight_opened_files = 'name',
    indent_markers = {
      enable = false,
    },
    icons = {
      show = {
        git = true,
        file = true,
        folder = true,
        folder_arrow = false,
      },
      glyphs = {
        default = '',
        git = {
          unstaged = '',
          staged = '',
          unmerged = '',
          renamed = '',
          untracked = '',
          deleted = '',
        },
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
