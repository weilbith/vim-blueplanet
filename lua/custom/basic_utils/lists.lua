local set = require "custom.models.set"

local M = {}

function M.intersect_lists(list_a, list_b)
    local set_a = set.from_list(list_a)
    local set_b = set.from_list(list_b)
    local intersection = {}

    for entry, _ in ipairs(set_a) do
        if set_b[entry] then
            table.insert(intersection, entry)
        end
    end

    return intersection
end

function M.exclude_lists(list_a, list_b)
    local set_a = set.from_list(list_a)
    local set_b = set.from_list(list_b)
    local a_excluded_b = {}

    for entry, _ in ipairs(set_a) do
        if not set_b[entry] then
            table.insert(a_excluded_b, entry)
        end
    end

    return a_excluded_b
end

return M
