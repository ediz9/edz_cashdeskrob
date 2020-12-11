ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('thermite', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent("edz-cashdeskrob:attemp", source)
end)

ESX.RegisterServerCallback('edz-cashdeskrob:copCount', function(source, cb)
	local xPlayers = ESX.GetPlayers()

	copConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
			copConnected = copConnected + 1
		end
	end

	cb(copConnected)
end)

RegisterServerEvent('edz-cashdeskrob:giveMoney')
AddEventHandler('edz-cashdeskrob:giveMoney', function(money)
    local xPlayer = ESX.GetPlayerFromId(source)
	--xPlayer.addMoney(money)
	xPlayer.addAccountMoney('black_money', money)
    TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text = money..'$ aldın'})
end)

RegisterServerEvent('edz-cashdeskrob:deleteItem')
AddEventHandler('edz-cashdeskrob:deleteItem', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(item, 1)
end)