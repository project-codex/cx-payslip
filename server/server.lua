local QBCore = exports['qb-core']:GetCoreObject()

local function afterTaxes(amount)
    return amount - (amount / 100 * Config.TaxPercentage)
end

RegisterNetEvent('cx-payslip:server:receive', function()
    local _s = source
    local Player = QBCore.Functions.GetPlayer(_s)
    local cid = Player.PlayerData.citizenid
    local playerPayslip = MySQL.scalar.await('SELECT payslip FROM players WHERE citizenid = ?', { cid })

    if playerPayslip > 0 then
        MySQL.update("UPDATE players SET payslip=payslip-? WHERE citizenid=?;", {
            playerPayslip,
            cid
        })
        Player.Functions.AddMoney('cash', playerPayslip)
        TriggerClientEvent('QBCore:Notify', _s, 'You received $' .. playerPayslip)
    else
        TriggerClientEvent('QBCore:Notify', _s, 'Your payslip is empty', 'error')
    end
end)

RegisterNetEvent("cx-payslip:server:checkPayslip", function()
    local _s = source
    local cid = QBCore.Functions.GetPlayer(_s).PlayerData.citizenid
    local playerPayslip = MySQL.scalar.await('SELECT payslip FROM players WHERE citizenid = ?', { cid })
    TriggerClientEvent('QBCore:Notify', _s, "Your payslip's balance is $" .. playerPayslip)
end)

exports('AddMoney', function(cid, amount)
    local playerPayslip = afterTaxes(amount)
    local Player = QBCore.Functions.GetPlayerByCitizenId(cid)
    local _s = Player.PlayerData.source

    MySQL.update("UPDATE players SET payslip=payslip+? WHERE citizenid=?;", {
        playerPayslip,
        cid,
    })

    if _s then
        TriggerClientEvent('qb-phone:client:CustomNotification', _s, 'Life Invader', '$'..amount..' were sent to your account', 'fas fa-file-invoice', '#52ff91', 5000)
    end
end)
