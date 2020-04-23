local vim = vim
local api = vim.api
local lsp = require "vim.lsp"
local lsp_methods = require "custom.lsp.methods"
local lsp_original_callback_backups = require "custom.lsp.original_callback_backups"
local lsp_rename_utils = require "custom.lsp.rename_utils"
local lsp_peek_definition_utils = require "custom.lsp.peek_definition_utils"

local function definition(err, method, params, client_id)
    lsp_original_callback_backups[lsp_methods.definition](err, method, params, client_id)
    api.nvim_command("silent! .foldopen")
end

local function references(err, method, params, client_id)
    lsp_original_callback_backups[lsp_methods.references](err, method, params, client_id)
    api.nvim_command("copen")
    api.nvim_command("wincmd p")
end

local function rename(err, method, params, client_id)
    local original_buffer_list = api.nvim_list_bufs()

    if lsp_rename_utils.check_if_rename_leaves_workspace_inconsistent(params) then
        lsp_rename_utils.attempt_to_clean_workspace(original_buffer_list, params)
        return
    end

    lsp_original_callback_backups[lsp_methods.rename](err, method, params, client_id)
    lsp_rename_utils.save_buffers_affected_by_rename(params)
    lsp_rename_utils.avoid_nvim_lsp_plugin_issues()
    lsp_rename_utils.wipe_buffers_loaded_for_rename(original_buffer_list, params)
    print("Rename done. All buffers saved and eventually removed again.")
end

local function peekDefinition(err, method, params, client_id)
    if not pcall(lsp_original_callback_backups[lsp_methods.definition], err, method, params, client_id) then
        lsp_peek_definition_utils.fake_peek_definition_via_plain_definition()
    end
end

local custom_callbacks = {}
custom_callbacks[lsp_methods.definition] = definition
custom_callbacks[lsp_methods.references] = references
custom_callbacks[lsp_methods.rename] = rename
custom_callbacks[lsp_methods.peekDefinition] = peekDefinition

local function customize_lsp_callback(request_name)
    lsp.callbacks[request_name] = custom_callbacks[request_name]
end

return {
    customize_lsp_callback = customize_lsp_callback
}
