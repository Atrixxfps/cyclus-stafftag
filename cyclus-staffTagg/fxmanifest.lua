fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'Cyclus Scripts | Atrixx#0001'
description 'FiveM: staff-tag'
version '1.0.0'
lua54 'yes'

escrow_ignore {
    'config.lua',
    'client/function.lua'
}

shared_scripts {
    'config.lua'
}
client_scripts {
    'client/*'
}

server_scripts {
    'server/*'
}