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



function  checkArg(name,arg, argType)
    if not arg then
        error("Argument " .. name .. " is nill")
    end
    if argType then
        if type (arg) ~= argType then
            error("Argument " .. name .. " is not of type " .. type)
        end 
    end    
end

if IsDuplicityVersion() then
    -- local sharedKey = math.random(1,1000)
    -- local eventKey = math.random(1,1000)
    -- SetConvarReplicated(encodeEvent (0,eventConvar), eventKey)
    -- SetConvarReplicated(encodeEvent (eventKey,sharedConvar), sharedKey)
    local eventKey = tonumber(GetConvar(encodeEvent (0,"eventConvar"), "")) 
    if not eventKey then
        error("eventKey is not set")
    end
    local sharedKey = tonumber(GetConvar(encodeEvent (eventKey,"sharedConvar"), "")) 
    if not sharedKey then
        error("sharedKey is not set")
    end

    local eventCallback = function(cb,name)
        return function(key, ...)
            local source = source
            if key ~= sharedKey then

                if Config.ElectronACIntegration then
                    TriggerEvent("ElectronAC:BanPlayer", source, "TriggerProtector","Tried to exploit event: "..name)
                else

                    if Config.log then
                        local player = getPlayername(source)
                        print("^1Player ^3" .. player .. "^1 tried to exploit an event: " .. name ..  "^0")
                    end

                end
            else
                cb(...)
            end
        end

    end
        
    

    function RegisterNetEventSecured(name,cb) 
        checkArg("name",name,"string")
        if cb then
            RegisterNetEvent(encodeEvent (eventKey, name), eventCallback(cb,name))
        else
            RegisterNetEvent(encodeEvent (eventKey, name))
        end
    end

    function AddEventHandlerSecured(name,cb) 
        checkArg("name",name,"string")
        checkArg("cb",cb,"function")
        AddEventHandler(encodeEvent (eventKey, name), eventCallback(cb,name))
    end
else
    local eventKey = tonumber(GetConvar(encodeEvent (0,"eventConvar"), "")) 
    if not eventKey then
        error("eventKey is not set")
    end
    local sharedKey = tonumber(GetConvar(encodeEvent (eventKey,"sharedConvar"), "")) 
    if not sharedKey then
        error("sharedKey is not set")
    end
    function TriggerServerEventSecured(name, ...) 
        checkArg("name",name,"string")
        TriggerServerEvent(encodeEvent (eventKey,name),sharedKey, ...)
    end
end
