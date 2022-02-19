Config = {}

Config.UseQbTarget = true -- If set to false, it will use qb-menu instead

Config.Coords = vector3(-1082.59, -246.88, 37.76) -- Coords for blip and box zone (qb-target) !! Changing these could cause issues.

Config.TaxPercentage = 5 -- Tax Percentage

Config.PayslipMenu = { -- qb-menu header
    {
        header = 'Check your payslip', -- Header title
        txt = 'Check your current balance', -- Header description
        params = {
            event = 'cx-payslip:client:payslip', -- Don't change
            args = 'check' -- Don't change
        }
    },
    {
        header = 'Receive Your Payslip', -- Header title
        txt = 'Receive your current balance', -- Header description
        params = {
            event = 'cx-payslip:client:payslip', -- Don't change
            args = 'receive' -- Don't change
        }
    }
}
