local efunc = {}
function efunc.include(tab, val)
    for k,v in ipairs(tab) do
        if v == val then
            return true
        end
    end
    return false
end

function efunc.table_visibility(tab, val)
    for _, v in pairs(tab) do
        if type(v) == "table" then
            efunc.table_visibility(v, val)
        else
            ui.set_visible(v, val)
        end
    end
end

function efunc.sort_pair(a, b)
    return a < b and a, b or b, a
end

function efunc.shuffle(a, b)
    local seq = {}
    for i = a, b do
        table.insert(seq, i)
    end
    for i = #seq, 2, -1 do
        local j = math.random(1, i)
        seq[i], seq[j] = seq[j], seq[i]
    end
    return seq
end

function efunc.ui_set_array(element, array)
    if type(element) ~= "number" or type(array) ~= "table" then
        return
    end
    if  ui.type(element) ~= "color_picker" or ui.type(element) ~= "multiselect" then
        return
    end
    ui.set(element, table.unpack(array))
end

function efunc.normalize(angle)
    return (angle + 180) % 360 - 180
end

function efunc.sort(arr)
    if #arr <= 1 then
        return arr
    end
    local pivot = arr[1]
    local left, right = {}, {}
    for i = 2, #arr do
        if arr[i] < pivot then
            table.insert(left, arr[i])
        else
            table.insert(right, arr[i])
        end
    end
    local left_sorted = efunc.sort(left)
    local right_sorted = efunc.sort(right)
    local result = {}
    for _, v in ipairs(left_sorted) do
        table.insert(result, v)
    end
    table.insert(result, pivot)
    for _, v in ipairs(right_sorted) do
        table.insert(result, v)
    end
    return result
end

function efunc.deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[efunc.deepcopy(orig_key)] = efunc.deepcopy(orig_value)
        end
        setmetatable(copy, efunc.deepcopy(getmetatable(orig)))
    else
        copy = orig
    end
    return copy
end

function efunc.array_unique(arr)
    local seen = {}
    local unique_arr = {}
    for _, v in ipairs(arr) do
        if not seen[v] then
            seen[v] = true
            table.insert(unique_arr, v)
        end
    end
    return unique_arr
end

function efunc.array_merge(arr1, arr2)
    local merged = {}
    for _, v in ipairs(arr1) do
        table.insert(merged, v)
    end
    for _, v in ipairs(arr2) do
        table.insert(merged, v)
    end
    return merged
end

function efunc.string_contains(str, substr)
    return string.find(str, substr) ~= nil
end

function efunc.table_is_empty(tab)
    return next(tab) == nil
end

function efunc.is_prime(n)
    if n <= 1 then return false end
    for i = 2, math.sqrt(n) do
        if n % i == 0 then
            return false
        end
    end
    return true
end

function efunc.clamp(val, min, max)
    if val < min then
        return min
    elseif val > max then
        return max
    else
        return val
    end
end

function efunc.table_count(tab)
    local count = 0
    for _ in pairs(tab) do
        count = count + 1
    end
    return count
end

return efunc