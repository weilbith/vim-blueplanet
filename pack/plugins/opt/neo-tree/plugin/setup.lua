require('neo-tree').setup({
  enable_git_status = true,
  enable_diagnostics = false,
  -- use_popups_for_input = false,
  popup_border_style = 'single',
  default_component_configs = {
    -- TODO: Try interesting file expander.
    modified = {
      symbol = '',
    },
    icon = {
      folder_empty = '',
      folder_empty_open = '',
    },
    git_status = {
      symbols = {
        added = '',
        modified = '',
        deleted = '',
        renamed = '',
        untracked = '',
        ignored = '',
        unstaged = '',
        staged = '',
        conflict = '',
      },
    },
  },
  window = {
    width = 30,
    mappings = {
      ['a'] = '',
      ['/'] = '',
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
  -- Check if something is a folder or a file.
  -- If server does not handle folders, get all files in folder.
  event_handlers = {
    {
      event = 'file_renamed',
      handler = function(arguments)
        require('custom.lsp.file_operations').rename(arguments.source, arguments.destination)
      end,
    },
    {
      event = 'file_moved',
      handler = function(arguments)
        require('custom.lsp.file_operations').rename(arguments.source, arguments.destination)
      end,
    },
  },
  -- source_selector = {
  --   winbar = true,
  --   content_layout = 'center',
  -- }
})
