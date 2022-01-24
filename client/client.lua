RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    blip = AddBlipForCoord(Config.Coords)
    SetBlipSprite(blip, 457)
    SetBlipDisplay(blip, 2)
    SetBlipScale(blip, 0.8)
    SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, 5)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Life Invader")
    EndTextCommandSetBlipName(blip)
end)

CreateThread(function()
    exports['qb-target']:AddBoxZone("life_invader", Config.Coords, 1, 1, {
        name = "life_invader",
        heading = 10.0,
        debugPoly = true,
        minZ = Config.Coords.z - 0.1,
        maxZ = Config.Coords.z + 0.3,
    }, {
        options = {
            {
                type = "server",
                event = "7rp-payslip:server:checkPayslip",
                icon = "fas fa-money-check",
                label = "Check Payslip",
            },
            {
                type = "server",
                event = "7rp-payslip:server:receive",
                icon = "fas fa-money-check",
                label = "Receive Payslip",
            },
        },
        distance = 2.5
    })
end)
