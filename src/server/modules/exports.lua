exports("trycatch", Core.Functions.TryCatch)
exports("Init", function()
    local init = {}

    init.Functions = Core.Functions
    init.Http = Core.Http

    return init
end)