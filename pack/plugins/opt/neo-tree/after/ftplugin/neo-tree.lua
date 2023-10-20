local function get_state()
  local manager = require('neo-tree.sources.manager')
  local source_name = 'filesystem' -- TODO: Make it work for all sources
  local tab_number = vim.api.nvim_tabpage_get_number(0)
  return manager.get_state(source_name, tab_number)
end

local function goto_parent()
  local state = get_state()
  local current_node = state.tree:get_node()
  local parent_identifer = current_node:get_parent_id()
  local renderer = require('neo-tree.ui.renderer')
  renderer.focus_node(state, parent_identifer)
end

local function add_to_parent()
  local state = get_state()
  local node = state.tree:get_node()
  local in_directory = node:get_parent_id() or node:get_id()
  local using_root_directory = state.path
  local actions = require('neo-tree.sources.filesystem.lib.fs_actions')
  local filesystem = require('neo-tree.sources.filesystem')
  local callback = function(path)
    filesystem.show_new_children(state, path)
  end

  actions.create_node(in_directory, callback, using_root_directory)
end

vim.api.nvim_buf_set_keymap(0, 'n', 'P', '', { callback = goto_parent })
vim.api.nvim_buf_set_keymap(0, 'n', 'a', '', { callback = add_to_parent })

vim.defer_fn(function()
  vim.opt_local.statuscolumn = nil
  vim.opt_local.winbar = nil
end, 1)
