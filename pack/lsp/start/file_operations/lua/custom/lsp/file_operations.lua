local function client_supports_renaming(client)
  return ((client.server_capabilities.workspace or {}).fileOperations or {}).willRename ~= nil
end

local function client_supports_renaming_folders(client)
  local options = (client.server_capabilities.workspace.fileOperations or {}).willRename

  local folder_filters = vim.tbl_filter(function(filter)
    return filter.pattern.matches == 'folder'
  end, options.filters or {})

  return #folder_filters > 0
end

local function path_is_folder(path)
  local ok, metadata = pcall(vim.uv.fs_stat, path)
  return ok and metadata.type == 'directory'
end

local function request_client(client, parameters)
  if client_supports_renaming(client) then
    local response = client.request_sync('workspace/willRenameFiles', parameters, nil, 0)
    local workspace_edit = (response or {}).result
    vim.lsp.util.apply_workspace_edit(workspace_edit, client.offset_encoding)
  end
end

local function rename(old_absolute_path, new_absolute_path)
  -- TODO: check for folders etc.
  local parameters = {
    files = {
      {
        oldUri = 'file://' .. old_absolute_path,
        newUri = 'file://' .. new_absolute_path,
      },
    },
  }

  for _, client in ipairs(vim.lsp.get_clients()) do
    request_client(client, parameters)
  end
end

return {
  rename = rename,
}
