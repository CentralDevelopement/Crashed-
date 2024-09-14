ESX = exports['es_extended']:getSharedObject()

local playersUsedCommand = {}

ESX.RegisterCommand('crashed', 'user', function(xPlayer, args, showError)
    local playerId = xPlayer.source

    
    if playersUsedCommand[playerId] then
        TriggerClientEvent('esx:showNotification', playerId, 'You have already used this command in this session.')
        return
    end

    
    playersUsedCommand[playerId] = true

    
    TriggerClientEvent('esx_crashed:spawnBMX', playerId)
end, false, {help = 'Spawn a BMX if you crashed', validate = true})

AddEventHandler('esx:playerDropped', function(playerId, reason)
    playersUsedCommand[playerId] = nil
end)
