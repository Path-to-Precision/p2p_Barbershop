if Config.getSharedObject == "last" then
	ESX = exports["es_extended"]:getSharedObject()
elseif Config.getSharedObject == "old" then
	ESX = nil
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end

RegisterNetEvent('p2p_Barbershop:buy')
AddEventHandler('p2p_Barbershop:buy', function(index)
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.price
	if index == 1 then
    	local xMoney = xPlayer.getMoney()
		if xMoney >= price then
			xPlayer.removeMoney(price)
			TriggerClientEvent('esx:showNotification', source, Config.Translate('notif_buy', "~g~"..price))
		else
			TriggerClientEvent('esx:showNotification', source, Config.Translate('notif_nomoney'))
		end
	elseif index == 2 then
		local xMoney = xPlayer.getAccount('bank').money
		if xMoney >= price then
			xPlayer.removeAccountMoney('bank', price)
			TriggerClientEvent('esx:showNotification', source, Config.Translate('notif_buy', "~b~"..price))
		else
			TriggerClientEvent('esx:showNotification', source, Config.Translate('notif_nomoney'))
		end
	end
end)