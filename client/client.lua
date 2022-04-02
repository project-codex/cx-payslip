RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
    if Config.UseQbTarget then
        exports['qb-target']:SpawnPed({
            model = 'a_m_m_prolhost_01',
            coords = Config.Coords,
            minusOne = true,
            freeze = true,
            invincible = true,
            blockevents = true,
            animDict = 'abigail_mcs_1_concat-0',
            anim = 'csb_abigail_dual-0',
            flag = 1,
            scenario = 'PROP_HUMAN_SEAT_COMPUTER',
            target = {
                options = {
                    {
                        type = "server",
                        event = "cx-payslip:server:checkPayslip",
                        icon = "fas fa-money-check",
                        label = "Check Your Payslip"
                    }, {
                        type = "server",
                        event = "cx-payslip:server:receive",
                        icon = "fas fa-money-check",
                        label = "Receive Your Payslip"
                    }
                },
                distance = 2.0,
            },
        })
    else
        local payslipZone = BoxZone:Create(vector3(-1082.02, -247.64, 37.76), 1.0, 4.2, {
            name = "payslip",
            heading = 25,
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

    if Config.ShowBlip then
        local blip = AddBlipForCoord(Config.Coords.x, Config.Coords.y, Config.Coords.z)
        SetBlipSprite(blip, 278)
        SetBlipDisplay(blip, 6)
        SetBlipScale(blip, 1.2)
        SetBlipAsShortRange(blip, true)
        SetBlipColour(blip, 1)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName('Life Invader')
        EndTextCommandSetBlipName(blip)
    end
end)
