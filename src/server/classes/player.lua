function Core.Classes:createUser(source)
    self = {}

    -- //[Variables]\\ --
    self.source = source
    self.name = GetPlayerName(source)
    self.license = (GetPlayerIdentifierByType(source, "license") or "N/A")
    self.identifiers = (GetPlayerIdentifiers(source) or {})

    -- //[Functions: Getter]\\ --
    self.get = function(key)
        return self[key]
    end

    -- //[Functions: Setter]\\ --
    self.set = function(key, value)
        local blackList = { ["source"] = true, ["name"] = true, ["license"] = true, ["identifiers"] = true }
        if blackList[key] then 
            error("This key is not allowed to be override!")
        end

        self[key] = value
    end

    -- //[Functions: ESX]\\ --
    self.xPlayer = function()
        if not Core.ESX.Installed then 
            error("ESX is not installed or not ready!")
        end

        return Core.ESX.GetPlayerFromId(self.source)
    end

    return self
end
