--[[
    How to use!!!! - not tested!!!

    local tryCatch = exports["bp:functions"].trycatch

    tryCatch(function()
        print("Hello World")
    end, function(error)
        print("Error: " .. error)
    end)
]]

exports("trycatch", Core.Functions.TryCatch, "bp:functions")
exports("getPlayer", Core.Functions.getPlayer, "bp:functions")
exports("getEntity", Core.Functions.getEntity, "bp:functions")
exports("getEntityByNetId", Core.Functions.getEntityByNetId, "bp:functions")