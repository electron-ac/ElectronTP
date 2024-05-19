-- 
--   ______ _      ______ _____ _______ _____   ____  _   _   _______ _____   
--   |  ____| |    |  ____/ ____|__   __|  __ \ / __ \| \ | | |__   __|  __ \ 
--   | |__  | |    | |__ | |       | |  | |__) | |  | |  \| |    | |  | |__) |
--   |  __| | |    |  __|| |       | |  |  _  /| |  | | . ` |    | |  |  ___/ 
--   | |____| |____| |___| |____   | |  | | \ \| |__| | |\  |    | |  | |     
--   |______|______|______\_____|  |_|  |_|  \_\\____/|_| \_|    |_|  |_|     
-- 
--                   Electron Trigger Protector
--             Our website: https://electron-ac.com
--


fx_version 'cerulean'
game 'gta5'

author 'Electron Services'
description 'Electron Trigger Protector'
version '1.0.0'
lua54 'yes'

files {
    "imports.lua",
}

shared_scripts {
    "src/shared/*.lua",
    "src/shared/*.js",
}

client_scripts {
    "src/client/*.lua",
    "src/client/*.js"
}

server_scripts {
    "config.lua",
    "config.js",
    "src/server/*.lua",
    "src/server/*.js",

}
