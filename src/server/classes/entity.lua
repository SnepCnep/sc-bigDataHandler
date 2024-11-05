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

    if self.entType == 1 then
        setmetatable(self, { __index = EntityFunctions["ped"] })
    elseif self.entType == 2 then
        setmetatable(self, { __index = EntityFunctions["vehicle"] })
    elseif self.entType == 3 then
        setmetatable(self, { __index = EntityFunctions["object"] })
    end

    return self
end

