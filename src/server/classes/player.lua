function Core.Classes:createUser(source)
    self = {}

    -- //[Varaibles]\\ --
    self.source = source
    self.name = GetPlayerName(source)
    self.identifiers = GetPlayerIdentifiers(source)


    -- //[Functions]\\ --
    self.getName = function()
        return self.name
    end

    self.getIdentifiers = function()
        return self.identifiers
    end

    return self
end