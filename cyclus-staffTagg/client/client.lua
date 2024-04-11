
local staffTable = {}
local staffTag = false

if Cyclus.VersionCheck == 'legacy' then
    ESX = exports["es_extended"]:getSharedObject()
elseif Cyclus.VersionCheck == 'old' then
    ESX = nil
elseif Cyclus.VersionCheck == 'qb' then
    QBCore = exports['qb-core']:GetCoreObject()
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    ESX.TriggerServerCallback('cyclus-staffTag:server:requestSync', function(request)
        staffTable = request
    end)
end)
if Cyclus.VersionCheck == 'legacy' or 'old' then
    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded', function(xPlayer)
        ESX.TriggerServerCallback('cyclus-staffTag:server:requestSync', function(request)
            staffTable = request
        end)
    end)
elseif Cyclus.VersionCheck == 'qb' then
    RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
    AddEventHandler('QBCore:Client:OnPlayerLoaded', function(xPlayer)
        QBCore.Functions.TriggerCallback('cyclus-staffTag:server:requestSync', function(request)
            staffTable = request
        end)
    end)
end

RegisterNetEvent('cyclus-staffTagg:client:syncTags', function(sync)
    staffTable = sync
end)

RegisterKeyMapping(Cyclus.commandName, 'staff-tag', 'keyboard', Cyclus.commandKey)

CreateThread(function()
    while true do
        Wait(0)
        for _, v in pairs(staffTable) do

            local ply = GetPlayerPed(GetPlayerFromServerId(v.id))
            local plyName = v.naam

            for _, staffTag in pairs(Cyclus.settingsTag) do

                local text = ' '..staffTag.nameTag..' '..plyName..' '
                local pedPos = GetEntityCoords(ply)
                local pedCoords = GetEntityCoords(PlayerPedId())
                local dist = #(pedPos - pedCoords)

                if dist <= staffTag.distanceTag then
                    if ply ~= PlayerPedId() then
                        DrawScriptText(pedPos.x, pedPos.y, pedPos.z + 1.1, text)
                    end
                end
            end
        end
    end
end)