fx_version 'cerulean'
game 'gta5'
version '2.0'
author 'choxen'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    'client/client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

shared_script {
    'config.lua'
}

lua54 'yes'
