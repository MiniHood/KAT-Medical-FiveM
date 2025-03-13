-- Resource Metadata
fx_version 'cerulean'
games { 'gta5' }

author 'HowNiceOfYou'
description 'Advanced medical system based on Arma 3\'s KAT medical system.'
version '1.0.0'

-- What to run
client_scripts {
    'client/ErrorHandler.lua',
    'client/Threading.lua',
    'client/Init.lua',
    'client/Network.lua',
    'client/PlayerHandler.lua',
    'client/*/*.lua'
}
server_scripts {
    'server/ErrorHandler.lua',
    'server/Threading.lua',
    'server/Init.lua',
    'server/Network.lua',
    'server/*/*.lua'
}