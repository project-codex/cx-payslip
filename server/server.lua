local QBCore = exports['qb-core']:GetCoreObject()

local function afterTaxes(amount)
    return amount - (amount / 100 * Config.TaxPercentage)
end

local function payslip(cid)
    return MySQL.scalar.await('SELECT payslip FROM players WHERE citizenid = ?', {
        cid
    })
end

RegisterServerEvent('7rp-payslip:server:receive')
AddEventHandler('7rp-payslip:server:receive', function()
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local cid = player.PlayerData.citizenid
    local playerPayslip = payslip(cid)

    if playerPayslip > 0 then
        MySQL.update("UPDATE players SET payslip=payslip-? WHERE citizenid=?;", {
            playerPayslip,
            cid
        })
        player.Functions.AddMoney('cash', playerPayslip)
        TriggerClientEvent('DoLongHudText', src, 'You received your payslip with amount ' .. playerPayslip .. '$', 1)
    else
        TriggerClientEvent('DoLongHudText', src, 'Your payslip is empty...', 2)
    end
end)

RegisterServerEvent("7rp-payslip:server:checkPayslip")
AddEventHandler("7rp-payslip:server:checkPayslip", function()
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local cid = player.PlayerData.citizenid
    local playerPayslip = payslip(cid)

    TriggerClientEvent('DoLongHudText', src, 'You have ' .. playerPayslip .. '$ in payslip', 1)
end)

exports('AddMoney', function(cid, amount)
    local playerPayslip = afterTaxes(amount)

    MySQL.update("UPDATE players SET payslip=payslip+? WHERE citizenid=?;", {
        playerPayslip,
        cid,
    })
end)
