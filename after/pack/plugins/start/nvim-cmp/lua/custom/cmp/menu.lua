local cmp = require('cmp')

local function find_index_in_list(list, entry_if_interest)
  for index, entry in ipairs(list or {}) do
    if entry == entry_if_interest then
      return index
    end
  end

  return 0
end

local function get_next_menu_entry()
  local selected_entry = cmp.get_selected_entry()
  local all_entries = cmp.get_entries()
  local selected_index = find_index_in_list(all_entries, selected_entry)
  local next_index = selected_index + 1

  if next_index <= #all_entries then
    return all_entries[next_index]
  else
    return nil
  end
end

local function get_previous_menu_entry()
  local selected_entry = cmp.get_selected_entry()
  local all_entries = cmp.get_entries()
  local selected_index = find_index_in_list(all_entries, selected_entry)
  local next_index = selected_index - 1

  if next_index >= 1 then
    return all_entries[next_index]
  else
    return nil
  end
end

--- Avoid to insert snippet entries without confirmation. Because some snippets
--- use the same trigger to manual as well as automatic activation. Cmp it's
--- default behavior to insert selected entry might trigger automatic snippet
--- activation.
local function get_selection_behavior_for_menu_entry(menu_entry)
  local source_name = ((menu_entry or {}).source or {}).name
  local is_snippet = source_name == 'luasnip'
  return is_snippet and cmp.ConfirmBehavior.Replace or cmp.ConfirmBehavior.Insert
end

return {
  get_next_menu_entry = get_next_menu_entry,
  get_previous_menu_entry = get_previous_menu_entry,
  get_selection_behavior_for_menu_entry = get_selection_behavior_for_menu_entry,
}
