-- Resource Metadata
fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

author 'HowNiceOfYou'
description 'Advanced medical system based on Arma 3\'s KAT medical system.'
version '1.0.0'

shared_scripts {
    'shared/**.lua',
    '@ox_lib/init.lua'
}

-- What to run
client_scripts {
    'client/Init.lua',

    'client/ErrorHandler.lua',
    'client/Threading.lua',
    'client/PlayerHandler.lua',
    'client/Network.lua',

    'client/Testing.lua',

    'client/Baseplate/**.lua',
    'client/Equipment/**.lua',
    'client/Fluid/**.lua',
    'client/Medicine/**.lua',
}
server_scripts {
    'server/Init.lua',

    'server/ErrorHandler.lua',
    'server/Threading.lua',
    'server/PlayerHandler.lua',
    'server/Network.lua',

    'server/Testing.lua',

    'server/Baseplate/**.lua',
    'server/Equipment/**.lua',
    'server/Fluid/**.lua',
    'server/Medicine/**.lua',
}