<div align="center">
    <img src="https://i.ibb.co/X2BwJJh/payslipbanner.png">
</div>

# A better way to collect your paychecks.

## Dependencies
* [polyzone](https://github.com/mkafrin/PolyZone)
* [qb-menu](https://github.com/qbcore-framework/qb-menu) or [qb-target](https://github.com/BerkieBb/qb-target)

## Installation
* Download the ZIP file and extract it in your resources folder.
* Run the SQL file
* Add ensure cx-payslip to your server.cfg

## How to use

Replace `Player.Functions.AddMoney(type, amount)` with `exports['cx-payslip']:AddMoney(cid, amount)`
