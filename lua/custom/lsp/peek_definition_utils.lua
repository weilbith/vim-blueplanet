local vim = vim
local api = vim.api
local lsp = require "vim.lsp"
local list_utils = require "custom.basic_utils.lists"
local lsp_methods = require("custom.lsp.methods")
local lsp_original_callback_backups = require "custom.lsp.original_callback_backups"

local function positive_number(number)
    if number < 1 then
        return 1
    else
        return number
    end
end

local function get_longest_line_of_file_in_range(uri, start_line, end_line)
    local file = vim.uri_to_fname(uri)
    local lines = api.nvim_call_function("readfile", {file, end_line})
    local lines_in_range = list_utils.slice(lines, start_line, end_line)
    local longest_line_length = 0

    for _, line in ipairs(lines_in_range) do
        if #line > longest_line_length then
            longest_line_length = #line
        end
    end

    return longest_line_length
end

local function definition_params_to_peek_definition_params(params)
    local position = params[1]
    local start_line = positive_number(position.range.start.line)
    local end_line = position.range["end"].line + 8
    local width = get_longest_line_of_file_in_range(position.uri, start_line, end_line)
    params[1].range.start = {character = 0, line = start_line or 1}
    params[1].range["end"] = {character = width, line = end_line}
    return params
end

local function forward_to_origin_callback_with_param_transformation(err, method, params, client_id)
    if not (params and params[1]) then
        return
    end

    local peek_params = definition_params_to_peek_definition_params(params)
    lsp_original_callback_backups[lsp_methods.peekDefinition](err, method, peek_params, client_id)
end

local function fake_peek_definition_via_plain_definition()
    local params = lsp.util.make_position_params()
    lsp.buf_request(0, lsp_methods.definition, params, forward_to_origin_callback_with_param_transformation)
end

return {
    fake_peek_definition_via_plain_definition = fake_peek_definition_via_plain_definition
}
