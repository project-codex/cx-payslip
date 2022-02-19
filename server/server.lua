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
        TriggerClientEvent('QBCore:Notify', src, 'You received your payslip with amount ' .. playerPayslip .. '$')
    else
        TriggerClientEvent('QBCore:Notify', src, 'Your payslip is empty...', 'error')
    end
end)

RegisterServerEvent("7rp-payslip:server:checkPayslip")
AddEventHandler("7rp-payslip:server:checkPayslip", function()
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local cid = player.PlayerData.citizenid
    local playerPayslip = payslip(cid)

    TriggerClientEvent('QBCore:Notify', src, 'You have ' .. playerPayslip .. '$ in payslip')
end)

exports('AddMoney', function(cid, amount)
    local playerPayslip = afterTaxes(amount)

    MySQL.update("UPDATE players SET payslip=payslip+? WHERE citizenid=?;", {
        playerPayslip,
        cid,
    })
end)
