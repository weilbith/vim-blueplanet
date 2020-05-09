local vim = vim
local api = vim.api

local M = {}

local capability_buffer_variable_name = "language_server_capabilities"

local function check_provider_value(property_name)
    -- TODO: This is stupid just to catch the error
    if not pcall(api.nvim_buf_get_var, 0, capability_buffer_variable_name) then
        return
    end

    local capabilities = api.nvim_buf_get_var(0, capability_buffer_variable_name)
    local value = capabilities[property_name]

    if value == nil then
        return false
    elseif type(value) == "boolean" then
        return value
    else
        print(string.format("Can't determine provider value '%s' of language server!", property_name))
        return false
    end
end

function M.store_capabilities_to_buffer(client)
    local buffer_number = api.nvim_get_current_buf()
    api.nvim_buf_set_var(buffer_number, capability_buffer_variable_name, client.server_capabilities)
end

function M.client_available()
    return next(vim.lsp.buf_get_clients()) ~= nil
end

function M.client_provides_highlighting()
    return check_provider_value("documentHighlightProvider")
end

function M.client_provides_definition()
    return check_provider_value("definitionProvider")
end

function M.client_provides_implementation()
    return check_provider_value("implementationProvider")
end

function M.client_provides_type_definition()
    return check_provider_value("typeDefinitionProvider")
end

function M.client_provides_declaration()
    return check_provider_value("declarationProvider")
end

function M.client_provides_references()
    return check_provider_value("referencesProvider")
end

function M.client_provides_signature_help()
    return check_provider_value("signatureHelpProvider")
end

function M.client_provides_hover()
    return check_provider_value("hoverProvider")
end

function M.client_provides_document_symbols()
    return check_provider_value("documentSymbolProvider")
end

function M.client_provides_workspace_symbols()
    return check_provider_value("workspaceSymbolProvider")
end

function M.client_provides_action()
    return check_provider_value("codeActionProvider")
end

function M.client_provides_formatting()
    return check_provider_value("documentFormattingProvider")
end

function M.client_provides_range_formatting()
    return check_provider_value("documentRangeFormattingProvider")
end

function M.client_provides_rename()
    return check_provider_value("renameProvider")
end

return M
