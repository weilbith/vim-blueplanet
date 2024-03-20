local diagnostic_signs = require('diagnostics.signs')

require('neo-tree').setup({
  enable_modified_markers = false,
  -- TODO: How to display expanders only where folds are?
  -- nesting_rules = {
  --   vue = { 'spec.ts' },
  --   ts = { 'spec.ts' },
  -- },
  sources = {
    'filesystem',
    'buffers',
    'git_status',
    'document_symbols',
  },
  default_component_configs = {
    modified = {
      symbol = '',
    },
    icon = {
      folder_empty = '',
      folder_empty_open = '',
    },
    name = {
      highlight_opened_files = true,
      use_git_status_colors = false,
    },
    diagnostics = {
      symbols = {
        hint = '',
        info = '',
        warn = diagnostic_signs.get_icon_by_severity_level('warn'),
        error = diagnostic_signs.get_icon_by_severity_level('error'),
      },
    },
    git_status = {
      symbols = {
        added = '',
        modified = '',
        deleted = '',
        renamed = '',
        untracked = '',
        ignored = '',
        unstaged = '',
        staged = '󰳡',
        conflict = '',
      },
    },
  },
  commands = {
    toggle_group_empty_dir = function(state)
      state.group_empty_dirs = not state.group_empty_dirs
      require('neo-tree.sources.manager').refresh(state.name)
    end,
  },
  window = {
    insert_as = 'sibling',
    mappings = {
      ['F'] = 'toggle_group_empty_dir',
    },
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = {
        '.git',
        'node_modules',
        '__pycache__',
        '.mypy_cache',
        '.pytest_cache',
        '.egg-info',
      },
      hide_by_pattern = {
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
      },
    },
    use_libuv_file_watcher = true,
    group_empty_dirs = true,
    scan_mode = 'deep',
  },
  source_selector = {
    winbar = true,
    content_layout = 'center',
    separator = { left = '', right = '' },
    show_separator_on_edge = true,
    separator_active = { left = '', right = '' },
    sources = {
      {
        source = 'filesystem',
        display_name = '󰙅',
      },
      {
        source = 'buffers',
        display_name = '󱩼',
      },
      {
        source = 'git_status',
        display_name = '󰊢',
      },
      -- {
      --   source = 'document_symbols',
      --   display_name = '',
      -- },
    },
  },
})

require('lsp-file-operations').setup()
