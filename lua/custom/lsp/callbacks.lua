local vim = vim
local api = vim.api
local lsp = require "vim.lsp"
local lsp_utils = require "custom.lsp.utils"

local M = {}

local request_names = {
    definition = "textDocument/definition",
    references = "textDocument/references",
    rename = "textDocument/rename"
}

local original_callback_backups = {}
original_callback_backups[request_names.definition] = lsp.callbacks[request_names.definition]
original_callback_backups[request_names.references] = lsp.callbacks[request_names.references]
original_callback_backups[request_names.rename] = lsp.callbacks[request_names.rename]

local function definition(err, method, params, client_id)
    original_callback_backups[request_names.definition](err, method, params, client_id)
    api.nvim_command("silent! .foldopen")
end

local function references(err, method, params, client_id)
    original_callback_backups[request_names.references](err, method, params, client_id)
    api.nvim_command("copen")
    api.nvim_command("wincmd p")
end

local function rename(err, method, params, client_id)
    local original_buffer_list = api.nvim_list_bufs()

    if lsp_utils.check_if_rename_leaves_workspace_inconsistent(params) then
        lsp_utils.attempt_to_clean_workspace(original_buffer_list, params)
        return
    end

    original_callback_backups[request_names.rename](err, method, params, client_id)
    lsp_utils.save_buffers_affected_by_rename(params)
    lsp_utils.avoid_nvim_lsp_plugin_issues()
    lsp_utils.wipe_buffers_loaded_for_rename(original_buffer_list, params)
    print("Rename done. All buffers saved and eventually removed again.")
end

local custom_callbacks = {}
custom_callbacks[request_names.definition] = definition
custom_callbacks[request_names.references] = references
custom_callbacks[request_names.rename] = rename

function M.customize_lsp_callback(request_name)
    lsp.callbacks[request_name] = custom_callbacks[request_name]
end

return M
