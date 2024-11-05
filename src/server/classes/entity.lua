local EntityFunctions = {
    ["ped"] = {},
    ["vehicle"] = {},
    ["object"] = {}
}

function Core.Classes:createEntity(entity)
    local self = {}

    -- //[Variables]\\ --
    self.entity = entity
    self.netId = NetworkGetNetworkIdFromEntity(entity)
    if self.netId == 0 then
        error("Entity is not networked.")
    end
    self.entOwner = NetworkGetEntityOwner(entity)
    self.entType = GetEntityType(entity) -- 1 = Ped, 2 = Vehicle, 3 = Object
    self.entModel = GetEntityModel(entity)

    -- //[Load Functions]\\ --
    if self.entType == 1 then
        for k, v in pairs(EntityFunctions["ped"]) do
            self[k] = v
        end
    elseif self.entType == 2 then
        for k, v in pairs(EntityFunctions["vehicle"]) do
            self[k] = v
        end
    elseif self.entType == 3 then
        for k, v in pairs(EntityFunctions["object"]) do
            self[k] = v
        end
    end

    return self
end

