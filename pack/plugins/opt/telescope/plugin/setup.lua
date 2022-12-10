require('telescope').setup({
  defaults = {
    prompt_prefix = '  ',
    selection_caret = '  ',
    entry_prefix = '   ',
    winblend = 10,
    file_ignore_patterns = { '%.fls', '%.fdb_latexmk' },
    borderchars = { ' ' },
    sorting_strategy = 'ascending',
    dynamic_preview_title = true,
    path_display = {
      truncate = true,
    },
    cache_picker = {
      num_pickers = -1,
    },
    layout_config = {
      horizontal = {
        prompt_position = 'top',
      },
    },
  },
  pickers = {
    git_commits = {
      mappings = {
        i = {
          ['d'] = function(buffer_number)
            local actions = require('telescope.actions')
            local state = require('telescope.actions.state')

            local picker = state.get_current_picker(buffer_number)
            local entries = picker:get_multi_selection()
            local first_commit = entries[1].value
            local last_commit = entries[#entries].value
            local commit_range = last_commit .. '..' .. first_commit
            local command = 'DiffviewFileHistory --reverse --range=' .. commit_range .. ' --reverse'

            actions.close(buffer_number)
            vim.cmd(command)
          end,
        },
      },
    },
  },
})
