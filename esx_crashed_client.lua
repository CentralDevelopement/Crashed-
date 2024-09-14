RegisterNetEvent('esx_crashed:spawnBMX')
AddEventHandler('esx_crashed:spawnBMX', function()
    local playerPed = PlayerPedId()  -
    local playerCoords = GetEntityCoords(playerPed)  

    
    local model = GetHashKey('bmx')
    RequestModel(model)

    
    while not HasModelLoaded(model) do
        Wait(500)
    end

    
    local bmx = CreateVehicle(model, playerCoords.x, playerCoords.y, playerCoords.z, GetEntityHeading(playerPed), true, false)

    
    TaskWarpPedIntoVehicle(playerPed, bmx, -1)

    
    SetModelAsNoLongerNeeded(model)
end)