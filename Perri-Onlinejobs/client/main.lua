Citizen.Wait(2000)
	ESX.TriggerServerCallback('OnlineJobs:getConnectedPlayers', function(connectedPlayers)
		UpdatePlayerTable(connectedPlayers)
end)

local showID = false

RegisterNetEvent('OnlineJobs:updateConnectedPlayers')
AddEventHandler('OnlineJobs:updateConnectedPlayers', function(connectedPlayers)
	UpdatePlayerTable(connectedPlayers)
end)

UpdatePlayerTable = function(connectedPlayers)

	local formattedPlayerList, num = {}, 1
	local ems, police, taxi, mechanic, players, taxi = 0, 0, 0, 0, 0, 0, 0

	for k,v in pairs(connectedPlayers) do
		if num == 1 then
			table.insert(formattedPlayerList, ('<tr><td></td><td>%s</td><td></td>'):format(v.id, v.ping))
			num = 2
		elseif num == 2 then
			table.insert(formattedPlayerList, ('<td></td><td>%s</td><td></td></tr>'):format(v.id, v.ping))
			num = 1
		end
		players = players + 1
		if v.job == 'ambulance' then
			ems = ems + 1
		elseif v.job == 'police' then
			police = police + 1
		elseif v.job == 'taxi' then
			taxi = taxi + 1
		elseif v.job == 'mechanic' then
			mechanic = mechanic + 1
		elseif v.job == 'taxi' then
			taxi = taxi + 1
		end
	end

	if num == 1 then
		table.insert(formattedPlayerList, '</tr>')
	end

	SendNUIMessage({
		action  = 'updatePlayerList',
		id = GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1))),
		players = table.concat(formattedPlayerList)
	})

	SendNUIMessage({
		action = 'updatePlayerJobs',
		jobs   = {
			ems = ems, 
			police = police,
			taxi = taxi, 
			mechanic = mechanic, 
			player_count = players,
			taxi = taxi
		}
	})
	
end

RegisterKeyMapping(Config['System']['Command'],Config['System']['Description'],"keyboard",Config['System']['Key'])
RegisterCommand(Config['System']['Command'],function()
	SendNUIMessage({
		action = 'toggle'
	})
end)