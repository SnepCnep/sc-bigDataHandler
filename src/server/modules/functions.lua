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

-- [Function: debug] --
function Core.Functions:debug(...)
    if not Config.Debug then return end

    oldPrint("^3[Core]", "^7[Debug] ^4: ", ...)
end
debug = function(...)
    Core.Functions:debug(...)
end