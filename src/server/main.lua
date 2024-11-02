-- //[Varaibles]\\ --
Core = { ESX = { Installed = false}, Players = {}, Cache = {}, Classes = {}, Functions = {} }
-- Classes = [ ClassName ] = Class Data Table
-- Functions = [ FunctionName ] = Function Data Table
-- DataBase = { connected = false }

Core.Functions:TryCatch(function()
    ESX = exports["es_extended"]:getSharedObject()
    Core.ESX = ESX
    Core.ESX.Installed = true
end, function(error)
    print("error", "[ESX] Failed to load ESX.")
end)

-- //[Player Handler]\\ --
RegisterNetEvent("playerJoining", function(source)
    if not source then return end

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

RegisterNetEvent("playerDropped", function()
    if not source then return end

    Core.Functions:TryCatch(function()
        Core.Cache.Players[source] = nil
        print("[playerDeleted Handler] Player leaved: " .. source)
    end, function(error)
        print("[playerDeleted Handler] Error: " .. error)
    end)
end)