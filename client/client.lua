RegisterNetEvent('cx-payslip:client:payslip', function(type)
    if type == 'check' then
        TriggerServerEvent('cx-payslip:server:checkPayslip')
    else
        TriggerServerEvent('cx-payslip:server:receive')
    end
end)

if Config.UseQbTarget then
    CreateThread(function()
        exports['qb-target']:AddBoxZone("life_invader", Config.Coords, 1, 3.6, {
            name = "life_invader",
            heading = 25.0,
            debugPoly = false,
            minZ = Config.Coords.z - 0.1,
            maxZ = Config.Coords.z + 0.3
        }, {
            options = {{
                type = "server",
                event = "cx-payslip:server:checkPayslip",
                icon = "fas fa-money-check",
                label = "Check Your Payslip"
            }, {
                type = "server",
                event = "cx-payslip:server:receive",
                icon = "fas fa-money-check",
                label = "Receive Your Payslip"
            }},
            distance = 2.5
        })
    end)
else
    local payslipZone = BoxZone:Create(vector3(-1082.02, -247.64, 37.76), 1.0, 4.2, {
        name="payslip",
        heading=25,
        --debugPoly=true
      })

    local headerDrawn = false
    payslipZone:onPlayerInOut(function(isPointInside, point)
        if isPointInside then
            if not headerDrawn then
                headerDrawn = true
                exports['qb-menu']:showHeader(Config.PayslipMenu)
            end
        else
            if headerDrawn then
                headerDrawn = false
                exports['qb-menu']:closeMenu()
            end
        end
    end)
end

CreateThread(function()
    local blip = AddBlipForCoord(Config.Coords)
    SetBlipSprite(blip, 457)
    SetBlipDisplay(blip, 2)
    SetBlipScale(blip, 0.8)
    SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, 5)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Life Invader")
    EndTextCommandSetBlipName(blip)
end)
