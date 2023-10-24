local function show_file_history(buffer_number)
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
end

require('telescope').setup({
  defaults = {
    prompt_prefix = '  ',
    entry_prefix = '   ',
    selection_caret = '  ',
    multi_icon = '  ',
    prompt_title = '',
    results_title = '',
    file_ignore_patterns = { '.git/*', '%.fls', '%.fdb_latexmk' },
    borderchars = {
      prompt = {
        '▔',
        ' ',
        ' ',
        ' ',
        '▔',
        '▔',
        ' ',
        ' ',
      },
      results = {
        ' ',
        ' ',
        '▁',
        ' ',
        ' ',
        ' ',
        '▁',
        '▁',
      },
      preview = {
        '▔',
        ' ',
        '▁',
        ' ',
        '▔',
        '▔',
        '▁',
        '▁',
      },
    },
    sorting_strategy = 'ascending',
    path_display = {
      truncate = true,
    },
    cache_picker = {
      num_pickers = 5,
    },
    layout_config = {
      horizontal = {
        prompt_position = 'top',
        width = { padding = 0 },
        height = { 0.5, min = 40, max = 60 },
      },
    },
  },
  pickers = {
    find_files = {
      prompt_title = '',
      preview_title = '',
    },
    git_commits = {
      mappings = {
        i = {
          ['d'] = show_file_history,
        },
      },
    },
    live_grep = {
      on_input_filter_cb = function(prompt)
        return { prompt = prompt:gsub('%s', '.*') }
      end,
    },
  },
})
