<div align="center">
    <img width="150" height="150" src="https://i.ibb.co/XzZZrBg/pc-logo-modified.png">
</div>

<h1 align="center">cx-payslip</h1>

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
