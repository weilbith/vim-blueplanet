local vim = vim
local api = vim.api
local lsp = require "vim.lsp"
local list_utils = require "custom.basic_utils.lists"
local buffer_utils = require "custom.basic_utils.buffers"
local ui_utils = require "custom.basic_utils.ui"

local function get_to_change_buffers(workspace_edit)
    local to_change_buffers = {}

    if workspace_edit.documentChanges then
        for _, change in ipairs(workspace_edit.documentChanges) do
            local buffer_number = vim.uri_to_bufnr(change.textDocument.uri)
            table.insert(to_change_buffers, buffer_number)
        end
    end

    if workspace_edit.changes then
        for uri, _ in pairs(workspace_edit.changes) do
            local buffer_number = vim.uri_to_bufnr(uri)
            table.insert(to_change_buffers, buffer_number)
        end
    end

    return to_change_buffers
end

local function get_inconsistent_buffers(workspace_edit)
    local modified_buffers_before_rename = buffer_utils.get_modified_buffers()
    local buffers_affected_by_rename = get_to_change_buffers(workspace_edit)
    return list_utils.intersect_lists(modified_buffers_before_rename, buffers_affected_by_rename)
end

local function ask_user_to_save_inconsistent_buffers(workspace_edit)
    local inconsistent_buffers = get_inconsistent_buffers(workspace_edit)
    local inconsistent_buffer_names = buffer_utils.get_buffer_names(inconsistent_buffers)
    local message =
        "The rename changes affect buffers in your workspace that are not saved. " ..
        "This would leave to an inconsistent workspace! Do you want to save these buffers and try again?" ..
            vim.inspect(inconsistent_buffer_names)
    return ui_utils.user_confirm(message)
end

local function save_inconsistent_buffers(workspace_edit)
    local inconsistent_buffers = get_inconsistent_buffers(workspace_edit)

    for _, buffer_number in ipairs(inconsistent_buffers) do
        buffer_utils.save_buffer_in_background(buffer_number)
    end
end

local function wipe_buffers_loaded_for_rename(original_buffer_list, workspace_edit)
    local buffers_affected_by_rename = get_to_change_buffers(workspace_edit)
    local buffers_loaded_for_rename = list_utils.exclude_lists(buffers_affected_by_rename, original_buffer_list)

    for _, buffer_number in ipairs(buffers_loaded_for_rename) do
        api.nvim_command(string.format("silent %dbwipeout!", buffer_number))
    end
end

local function check_if_rename_leaves_workspace_inconsistent(workspace_edit)
    local inconsistent_buffers = get_inconsistent_buffers(workspace_edit)
    return table.getn(inconsistent_buffers) > 0
end

local function attempt_to_clean_workspace(original_buffer_list, workspace_edit)
    if ask_user_to_save_inconsistent_buffers(workspace_edit) then
        wipe_buffers_loaded_for_rename(original_buffer_list, workspace_edit)
        save_inconsistent_buffers(workspace_edit)
        -- TODO: Avoid asking user again and parse new name workspace edit
        lsp.buf.rename()
    else
        wipe_buffers_loaded_for_rename(original_buffer_list, workspace_edit)
        print("Abort!")
    end
end

local function save_buffers_affected_by_rename(workspace_edit)
    local buffers_affected_by_rename = get_to_change_buffers(workspace_edit)

    for _, buffer_number in ipairs(buffers_affected_by_rename) do
        buffer_utils.save_buffer_in_background(buffer_number)
    end
end

local function avoid_nvim_lsp_plugin_issues()
    -- The problem is that the 'nvim-lsp' plugin registers an auto command for all
    -- new buffers which are loaded in background. This command is focused on
    -- a specific buffer (<buffer=##>). If the buffer gets wiped out too fast,
    -- setting the auto command fails due to a non existing buffer reference. As
    -- result, the user will see an error message and the buffer gets reloaded
    -- with a new buffer number, even if it was just wiped out. Therefore this
    -- short sleep secures that the 'nvim-lsp' plugin does not fail.
    vim.api.nvim_command("sleep 100m")
end

return function(_, _, result)
    local original_buffer_list = api.nvim_list_bufs()

    if check_if_rename_leaves_workspace_inconsistent(result) then
        attempt_to_clean_workspace(original_buffer_list, result)
        return
    end

    lsp.utils.util.apply_workspace_edit(result)
    save_buffers_affected_by_rename(result)
    avoid_nvim_lsp_plugin_issues()
    wipe_buffers_loaded_for_rename(original_buffer_list, result)
    print("Rename done. All buffers saved and eventually removed again.")
end
