MySQL.ready(function()
    Core.DataBase.connected = true
end)

function Core.DataBase:AwaitReady()
    local promise = promise.new()

    if Core.DataBase.connected then
        promise:resolve()
    else
        CreateThread(function()
            local timeout = os.time() + (Config.DataBaseTimeout and type(Config.DataBaseTimeout) == "number" or 10)
            while not Core.DataBase.connected do
                if os.time() > timeout then
                    promise:reject("Timeout waiting for database connection")
                    return
                end
                Wait(1)
            end
            promise:resolve()
        end)
    end

    return promise
end
