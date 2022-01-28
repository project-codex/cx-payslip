fx_version 'adamant'
game 'gta5'
version '1.0'
author = 'choxens'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

shared_script {
    'config.lua'
}

dependencies {
    'qb-core'
}

lua54 'yes'
