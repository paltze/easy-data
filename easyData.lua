local saveData = {}

local function serialize(dataTable)
    local str = ""
    for i, v in pairs(dataTable) do
        if not (type(v) == "number" or type(v) == "string" or type(v) == "boolean" or type(v) == "nil") then break end
        if type(v) == "boolean" then
            v = tostring(v)
        end
        str = str..i..":"..type(v).."="..v..";"
    end

    local toHex = function(strings)
        return (strings:gsub('.', function (c)
            return string.format('%02X', string.byte(c))
        end))
    end

    return toHex(str:sub(1, -2))
end

local function deserialize(str)
    local result = {}

    local fromHex = function(strings)
        return (strings:gsub('..', function (cc)
            return string.char(tonumber(cc, 16))
        end))
    end

    str = fromHex(str)

    local split = function(inputstr, sep)
        local t = {}
        for res in string.gmatch(inputstr, "([^"..sep.."]+)") do table.insert(t, res) end
        return t
    end

    for _, v in ipairs(split(str, ";")) do
        local tempKey = split(v, "=")[1]
        local value = split(v, "=")[2]
        local key = split(tempKey, ":")[1]
        local typeOf = split(tempKey, ":")[2]
        if typeOf == "number" then
            value = tonumber(value)
        elseif typeOf == "boolean" then
            if value == "true" then
                value = true
            else
                value = false
            end
        end
        result[key] = value
    end

    return result
end

function saveData.save(id, dataTable)
    return love.filesystem.write(id..".sav", serialize(dataTable))
end

function saveData.load(id)
    if love.filesystem.read(id..".sav") == nil then
        return nil
    else
        return deserialize(love.filesystem.read(id..".sav"))
    end
end

return saveData