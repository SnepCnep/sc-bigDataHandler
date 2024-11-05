-- [Function: TryCatch]
function Core.Functions:TryCatch(func, catch)
    local promise = promise.new()

    CreateThread(function()
        local status, result = pcall(func)

        if status then
            promise:resolve(result)
        else
            catch(result)
            promise:reject(result)
        end
    end)

    return promise
end

-- [Function: getPlayer] --
function Core.Functions:getPlayer(source)
    if not source then return false end

    return (Core.Cache.Players[source] or false)
end

-- [Function: getEntitie] --
function Core.Functions:getEntitie(entity)
    if not entity or not DoesEntityExist(entity) then return false end

    local netId = NetworkGetNetworkIdFromEntity(entity)
    return (Core.Cache.Entities[netId] or false)
end

-- [Function: getEntitieByNetId] --
function Core.Functions:getEntitieByNetId(netId)
    if not netId then return false end

    return (Core.Cache.Entities[netId] or false)
end

-- [Function: exports] --
local _exports = exports
function Core.Functions:exports(exportName, exportFunc, exportResource)
    if not exportName or not exportFunc then return end

    if not exportResource then
        _exports(('_cfx_export_sc-boilerplate_%s'):format(exportName), exportFunc)
        debug("Create a export: " .. exportName)
        return
    end
    debug("Create a export: " .. exportResource .. " - " .. exportName)
    _exports(('_cfx_export_%s_%s'):format(exportResource, exportName), exportFunc)
end
exports = function(...)
    return Core.Functions:exports(...)
end

-- [Function: print] --
local _print = print
function Core.Functions:print(type, ...)
    local types = { ["warn"] = "^3[Core] ^3[Warn] ^7", ["error"] = "^3[Core] ^1[Error] ^7", ["info"] = "^3[Core] ^2[Info] ^7" }
    if types[type] then
        _print(types[type], ...)
    else
        _print("^3[Core] ^7", type, ...)
    end
end
print = function(...)
    Core.Functions:print(...)
end

-- [Function: debug] --
function Core.Functions:debug(...)
    if not Config.Debug then return end

    _print("^3[Core]", "^7[Debug] ^4: ", ...)
end
debug = function(...)
    Core.Functions:debug(...)
end