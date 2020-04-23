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

function M.fix_index(list, index)
    if not index then
        return 1
    end
    if index < 0 then
        return 0
    elseif index > #list then
        return #list
    else
        return index
    end
end

function M.slice(list, from, to)
    local sliced = {}

    from = M.fix_index(list, from)
    to = M.fix_index(list, to)

    for i = from, to, 1 do
        sliced[#sliced + 1] = list[i]
    end

    return sliced
end

return M
