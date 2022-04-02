-- To edit the blip and/or the polyzone for qb-menu, check out client/main.lua

Config = {}

Config.UseQbTarget = false -- If set to false, it will use qb-menu instead

Config.Coords = vector4(-1083.95, -246.19, 37.25, 209.08) -- Coords for blip and ped

Config.TaxPercentage = 5 -- Tax Percentage

Config.ShowBlip = false

Config.PayslipMenu = { -- qb-menu header
    {
        header = 'Check your payslip', -- Header title
        txt = 'Check your current balance', -- Header description
        params = {
            isServer = true,
            event = 'cx-payslip:server:checkPayslip', -- Don't change
            args = 'check' -- Don't change
        }
    },
    {
        header = 'Receive Your Payslip', -- Header title
        txt = 'Receive your current balance', -- Header description
        params = {
            isServer = true,
            event = 'cx-payslip:server:receive', -- Don't change
            args = 'receive' -- Don't change
        }
    }
}
