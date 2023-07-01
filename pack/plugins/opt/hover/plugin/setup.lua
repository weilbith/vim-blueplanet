require('hover').setup({
  init = function()
    require('hover.providers.lsp')
    require('hover.providers.gh')
    require('hover.providers.gh_user')
    require('hover.providers.jira')
    require('hover.providers.man')
    require('hover.providers.dictionary')
  end,
})

local function find_hover_window()
  local all_windows = vim.api.nvim_list_wins()

  local hover_windows = vim.tbl_filter(function(window_number)
    return vim.F.npcall(vim.api.nvim_win_get_var, window_number, 'hover')
  end, all_windows)

  return hover_windows[1]
end

local function hover_window_is_open()
  return find_hover_window() ~= nil
end

--- Parses the window bar content based on the knowledge how it is composed.
--- The structure is list of "active" providers with some highlighting. In front
--- of each provider name, the highlight group "TabLineSel" or "TabLineFill" is
--- used to indicate which one of them is active. After each provider name the
--- highlight gets reset with "Normal".
---
--- With that knowledge, this function creates a mapping of provider names to
--- a boolean value if they are selected or not. In theory there can be only one
--- selected.
--- On top of this, these mapping tuples are put into list as their order
--- matters.
---
--- Example:
--- "%#TabLineFill# LSP %#Normal# %#TabLineSel# Dictionary %#Normal#"
---    =>
--- { { name = "LSP", isSelected = false }, { name = "Dictionary", isSelected = true }}
local function parse_window_bar_to_provider_selection_mapping(window_bar)
  local parts = vim.split(window_bar, ' ')
  local active_providers = {}

  for index = 2, #parts, 3 do
    local name = parts[index]
    local isSelected = parts[index - 1]:find('TabLineSel') ~= nil
    table.insert(active_providers, { name = name, isSelected = isSelected })
  end

  return active_providers
end

local function get_index_of_first_match(callback, list)
  for index, entry in ipairs(list) do
    if callback(entry) then
      return index
    end
  end

  return nil
end

local function hover_next_provider()
  local hover_window = find_hover_window()
  local window_bar = vim.wo[hover_window].winbar
  local active_providers = parse_window_bar_to_provider_selection_mapping(window_bar)
  local selected_provider_index = get_index_of_first_match(function(provider)
    return provider.isSelected
  end, active_providers)

  local next_provider_name = active_providers[selected_provider_index + 1].name

  print(vim.inspect(next_provider_name))
end

_G.find_it = function()
  if hover_window_is_open() then
    hover_next_provider()
  else
    require('hover').hover()
  end
end
