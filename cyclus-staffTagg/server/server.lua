if Cyclus.VersionCheck == 'legacy' then
    ESX = exports["es_extended"]:getSharedObject()
elseif Cyclus.VersionCheck == 'old' then
    ESX = nil
elseif Cyclus.VersionCheck == 'qb' then
    QBCore = exports['qb-core']:GetCoreObject()
end

local AdminPlayers  = {}
if Cyclus.VersionCheck == 'legacy' or 'old' then
    ESX.RegisterServerCallback('cyclus-staffTag:server:requestSync', function(source, cb)
        cb(AdminPlayers)
    end)
elseif Cyclus.VersionCheck == 'qb' then 
    QBCore.Functions.CreateCallback('cyclus-staffTag:server:requestSync', function(source, cb)
        cb(AdminPlayers)
    end)
end


RegisterCommand(Cyclus.commandName, function(source, args)
    local name = GetPlayerName(source)
    if Cyclus.VersionCheck == 'legacy' or 'old' then
        xPlayer = ESX.GetPlayerFromId(source)
    elseif Cyclus.VersionCheck == 'qb' then 
        xPlayer = QBCore.Functions.GetPlayer(source)
    end
    
    for _, staffTag in pairs(Cyclus.settingsTag) do
        if xPlayer.group == staffTagg.groupCheck then
            if AdminPlayers[source] == nil then
                AdminPlayers[source] = {
                    ['id'] = source,
                    ['naam'] = name
                }
                TriggerClientEvent('cyclus-staffTagg:client:syncTags', -1, AdminPlayers)
            else
                AdminPlayers[source] = nil
                TriggerClientEvent('cyclus-staffTagg:client:syncTags', -1, AdminPlayers)
            end
        else
            TriggerClientEvent('cyclus-staffTagg:client:notify', source) 
        end
    end

end)

if Cyclus.VersionCheck == 'old' then
    AddEventHandler('esx:playerDropped', function(source)
        if AdminPlayers[source] ~= nil then
            AdminPlayers[source] = nil
        end
        TriggerClientEvent('cyclus-staffTagg:client:syncTags', -1, AdminPlayers)
    end)
elseif Cyclus.VersionCheck == 'legacy' then
    RegisterNetEvent('esx:playerDropped', function(playerId, reason)
        if AdminPlayers[source] ~= nil then
            AdminPlayers[source] = nil
        end
        TriggerClientEvent('cyclus-staffTagg:client:syncTags', -1, AdminPlayers)
    end)
elseif Cyclus.VersionCheck == 'qb' then
    -- CODE
end