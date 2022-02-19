ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

enableprice = false -- true = mecanic is paid, false = mecanic is free
local price = 500 -- you may edit this to your liking. if "enableprice = false" ignore this one

RegisterServerEvent('mechanic:checkmoney')
AddEventHandler('mechanic:checkmoney', function ()
	if enableprice == true then
		TriggerEvent('es:getPlayerFromId', source, function (user)
			userMoney = user.getMoney()
			if userMoney >= price then
				user.removeMoney(price)
				TriggerClientEvent('mechanic:success', source, price)
			else
				moneyleft = price - userMoney
				TriggerClientEvent('mechanic:notenoughmoney', source, moneyleft)
			end
		end)
	else
		TriggerClientEvent('mechanic:free', source)
	end
end)