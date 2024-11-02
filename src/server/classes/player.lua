function Core.Classes:createUser(source)
    self = {}

    -- //[Variables]\\ --
    self.source = source
    self.name = GetPlayerName(source)
    self.identifiers = GetPlayerIdentifiers(source)

    -- //[Functions: Getter]\\ --
    self.get = function(key)
        return self[key]
    end

    -- //[Functions: Setter]\\ --
    self.set = function(key, value, override)
        local blackList = { "source", "name", "identifiers" }
        if not override and self[key] then 
            error("This key is already set!")
        end
        if blackList[key] then 
            error("This key is not allowed to be override!") 
        end

        self[key] = value
    end

    -- //[Functions: ESX]\\ --
    self.xPlayer = function()
        if not Core.ESX.Installed then return end

        return ESX.GetPlayerFromId(self.source)
    end

    return self
end
