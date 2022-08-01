local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("outdoor_grill" , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player.Functions.GetItemByName(item.name) then return end
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("inventory:client:ItemBox", source, item, "remove")
        TriggerClientEvent("grilling:client:SpawnGrill", source)
    end
end)

QBCore.Functions.CreateCallback("grilling:server:createMenu", function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local itemName, itemAmount = nil, 0
    local itemMenu = {}
    if Player.PlayerData.items ~= nil then
        for i, v in pairs(Player.PlayerData.items) do
            if Config.Cookables[Player.PlayerData.items[i].name] then
                itemName, itemAmount = Player.PlayerData.items[i].name, Player.PlayerData.items[i].amount
                table.insert(itemMenu, {
                    itemName = itemName,
                    itemAmount = itemAmount
                })
            end
        end
    end
    cb(itemMenu)
end)

RegisterNetEvent("grilling:server:DismantleGrill", function(grill)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Item = QBCore.Shared.Items["outdoor_grill"]
    if Player.Functions.AddItem(Item.name, 1) then
        TriggerClientEvent('inventory:client:ItemBox', source, Item, 'add')
    end
end)

RegisterNetEvent("grilling:server:getReward", function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Item = Player.Functions.GetItemByName(item)
    local Reward = QBCore.Shared.Items[Config.Cookables[Item.name].reward]
    if not Item then return end
    if Player.Functions.RemoveItem(Item.name, 1, Item.slot) then
        if Player.Functions.AddItem(Reward.name, 1) then
            TriggerClientEvent('inventory:client:ItemBox', source, Reward, 'add')
        end
    end
end)