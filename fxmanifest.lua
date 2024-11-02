fx_version "adamant"
game "gta5"
use_fxv2_oal "yes"
lua54 "yes"

name "Boilerplate"
author "SnepCnep"
description "Boilerplate for FiveM resources"
version "1.0.0"

client_scripts { 
    "src/client/main.lua",
    "src/client/modules/*.lua" 
}
server_scripts { 
    "config.lua", 
    "src/server/main.lua",
    "@oxmysql/lib/MySQL.lua",
    "src/server/modules/*.lua",
}
shared_scripts { 
    "@es_extended/imports.lua", 
    "@ox_lib/init.lua" 
}