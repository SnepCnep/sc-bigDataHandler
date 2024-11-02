-- //[Varaibles]\\ --
Core = { ESX = {}, Cache = { Players = {}, Entitys = {} }, Classes = {}, Functions = {} }
-- Cache = { Players = [ PlayerId ] = Player Data Table, Entitys = [ EntityId ] = Entity Data Table }
-- Classes = [ ClassName ] = Class Data Table
-- Functions = [ FunctionName ] = Function Data Table
-- DataBase = { connected = false }

Core.Functions:TryCatch(function()
    ESX = exports["es_extended"]:getSharedObject()
    Core.ESX = ESX
end, function(error)
    print("error", "[ESX] Failed to load ESX.")
end)

-- //[Player Handler]\\ --
RegisterNetEvent("", function(source)

    Core.Functions:TryCatch(function()
        if Core.Cache.Players[source] then
            print("[playerCreated Handler] Override player: " .. source)
        end
        Core.Cache.Players[source] = Core.Classes:createUser(source)
        print("[playerCreated Handler] Player joined: " .. source)
    end, function(error)
        print("[playerCreated Handler] Error: " .. error)
    end)
end)

RegisterNetEvent("", function(source)

    Core.Functions:TryCatch(function()
        Core.Cache.Players[source] = nil
        print("[playerDeleted Handler] Player leaved: " .. source)
    end, function(error)
        print("[playerDeleted Handler] Error: " .. error)
    end)
end)

-- //[Entity Handler]\\ --
RegisterNetEvent("entityCreated", function(entity)
    if not DoesEntityExist(entity) or entity == 1 then return end

    local netId = NetworkGetNetworkIdFromEntity(entity)

    Core.Functions:TryCatch(function()
        if Core.Cache.Entitys[netId] then  
            print("warn", "[entityCreated Handler] Override entity: " .. netId)
        end
        Core.Cache.Entitys[netId] = Core.Classes:createEntity(entity)
        print("info", "[entityCreated Handler] Entity Created: " .. netId)
    end, function(error)
        print("error", "[entityCreated Handler] Error: " .. error)
    end)
end)

RegisterNetEvent("entityDeleted", function(entity)
    local netId = NetworkGetNetworkIdFromEntity(entity)

    Core.Functions:TryCatch(function()
        Core.Entitys[netId] = nil
        print("warn", "[entityDeleted Handler] Entity Deleted: " .. netId)
    end, function(error)
        print("error", "[entityDeleted Handler] Error: " .. error)
    end)
end)