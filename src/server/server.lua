

function encodeEvent(key,message)
    local len = 64
    local m = message
    for i = 1, #m do
        local symbol = string.sub(m, i, i)
        key = key + string.byte(symbol) * i + string.byte(symbol)
    end
    math.randomseed(key)
    local encoded = ""
    for i = 1, len do
        encoded = encoded .. string.char(math.random(97, 122))
    end
    return encoded
end

local sharedKey = math.random(1,1000)
local eventKey = math.random(1,1000)
SetConvarReplicated(encodeEvent (0,"eventConvar"), eventKey)
SetConvarReplicated(encodeEvent (eventKey,"sharedConvar"), sharedKey)

Citizen.CreateThread(function ()
    TriggerEvent("ElectronTP:initialize", Config.ElectronACIntegration)
end)
