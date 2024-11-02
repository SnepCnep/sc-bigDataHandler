MySQL.ready(function()
    Core.DataBase.connected = true
end)

function Core.DataBase:AwaitReady()
    while not Core.DataBase.connected do
        Citizen.Wait(0)
    end
end