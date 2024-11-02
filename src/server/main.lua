-- //[Varaibles]\\ --
Core = { Players = {}, Entitys = {}, Classes = {}, Functions = {}, DataBase = { connected = false } }
-- Players = [ source ] = Player Data Table
-- Entitys = [ entity ] = Entity Data Table
-- Classes = [ ClassName ] = Class Data Table
-- Functions = [ FunctionName ] = Function Data Table
-- DataBase = { connected = false }

-- //[Functions]\\ --


-- [Function: TryCatche]
function Core.Functions:TryCatche(func, catch)
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

-- [Function: print] --
local oldPrint = print
function Core.Functions:print(type, ...)
    local types = { ["warn"] = "^3[Core] ^3[Warn] ^7", ["error"] = "^3[Core] ^1[Error] ^7", ["info"] = "^3[Core] ^2[Info] ^7" }
    if types[type] then
        oldPrint(types[type], ...)
    else
        oldPrint("^3[Core] ^7", type, ...)
    end
end
print = function(...)
    Core.Functions:print(...)
end


-- //[Player Handler]\\ --
RegisterNetEvent("", function(source)
    Core.Functions:TryCatche(function()
        Core.Players[source] = Core.Classes:createUser(source)
        print("[playerCreated Handler] Player joined: " .. source)
    end, function(error)
        print("[playerCreated Handler] Error: " .. error)
    end)
end)

RegisterNetEvent("", function(source)
    Core.Functions:TryCatche(function()
        Core.Players[source] = nil
        print("[playerDeleted Handler] Player leaved: " .. source)
    end, function(error)
        print("[playerDeleted Handler] Error: " .. error)
    end)
end)

-- //[Entity Handler]\\ --
RegisterNetEvent("entityCreated", function(entity)
    if not DoesEntityExist(entity) or entity == 1 then return end

    local netId = NetworkGetNetworkIdFromEntity(entity)

    Core.Functions:TryCatche(function()
        if Core.Entitys[netId] then  
            print("warn", "[entityCreated Handler] Override entity: " .. netId)
        end
        Core.Entitys[netId] = Core.Classes:createEntity(entity)
        print("info", "[entityCreated Handler] Entity Created: " .. netId)
    end, function(error)
        print("error", "[entityCreated Handler] Error: " .. error)
    end)
end)

RegisterNetEvent("entityDeleted", function(entity)
    local netId = NetworkGetNetworkIdFromEntity(entity)

    Core.Functions:TryCatche(function()
        Core.Entitys[netId] = nil
        print("warn", "[entityDeleted Handler] Entity Deleted: " .. netId)
    end, function(error)
        print("error", "[entityDeleted Handler] Error: " .. error)
    end)
end)


