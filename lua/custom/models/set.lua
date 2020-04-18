local M = {}

function M.from_list(list)
    local set = {}

    for _, entry in ipairs(list) do
        set[entry] = true
    end

    return set
end

return M
