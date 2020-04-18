local vim = vim
local api = vim.api
local lsp = require "vim.lsp"
local lsp_utils = require "custom.lsp.utils"

local M = {}

function M.extendDefinitionCallback()
    local request_name = "textDocument/definition"
    local original_callback = lsp.callbacks[request_name]

    lsp.callbacks[request_name] = function(err, method, result, _)
        original_callback(err, method, result)
        api.nvim_command("silent! .foldopen")
    end
end

function M.extendReferencesCallback()
    local request_name = "textDocument/references"
    local original_callback = lsp.callbacks[request_name]

    lsp.callbacks[request_name] = function(err, method, result, _)
        original_callback(err, method, result)
        api.nvim_command("copen")
    end
end

function M.extendRenameCallback()
    local request_name = "textDocument/rename"
    local original_callback = lsp.callbacks[request_name]

    lsp.callbacks[request_name] = function(err, method, workspace_edit, _)
        local original_buffer_list = api.nvim_list_bufs()

        if lsp_utils.check_if_rename_leaves_workspace_inconsistent(workspace_edit) then
            lsp_utils.attempt_to_clean_workspace(original_buffer_list, workspace_edit)
            return
        end

        original_callback(err, method, workspace_edit)
        lsp_utils.save_buffers_affected_by_rename(workspace_edit)
        lsp_utils.avoid_nvim_lsp_plugin_issues()
        lsp_utils.wipe_buffers_loaded_for_rename(original_buffer_list, workspace_edit)
        print("Rename done. All buffers saved and eventually removed again.")
    end
end

return M
