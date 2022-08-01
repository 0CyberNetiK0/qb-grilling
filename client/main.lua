local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()

local Grills = {}

RegisterNetEvent("grilling:client:SpawnGrill", function()
    local Ped = PlayerPedId()
    local pedTranformForward = GetEntityCoords(Ped) + GetEntityForwardVector(Ped)
    local pedHeading = GetEntityHeading(Ped)
    local newGrill = CreateObject(1903501406, pedTranformForward.x, pedTranformForward.y, pedTranformForward.z, true)
    Grills[newGrill] = newGrill
    PlaceObjectOnGroundProperly(newGrill)
    SetEntityHeading(newGrill, pedHeading)
end)

RegisterNetEvent("grilling:client:AccessGrill", function()
    QBCore.Functions.TriggerCallback("grilling:server:createMenu", function(itemMenu)
        if itemMenu then
            local newItemMenu = {}
            table.insert(newItemMenu, {
                header = "Grill",
                isMenuHeader = true
            })
            for _, itemData in pairs(itemMenu) do
                local newEntry = {}
                local Label = tostring(QBCore.Shared.Items[itemData.itemName].label)
                newEntry.header = "x"..tostring(itemData.itemAmount).." "..Label
                newEntry.txt = "Click to cook 1x "..Label
                newEntry.params = {
                    event = "grilling:client:CookItem",
                    args = {
                        itemName = itemData.itemName,
                        Label = Label
                    }
                }
                table.insert(newItemMenu, newEntry)
            end
            exports['qb-menu']:openMenu(newItemMenu)
        end
    end)
end)

RegisterNetEvent("grilling:client:DismantleGrill", function()
    local Ped = PlayerPedId()
    local pedCoords = GetEntityCoords(Ped)
    local Grill = GetClosestObjectOfType(pedCoords, 5.0, GetHashKey("prop_bbq_1"), false, false, false)
    if Grill ~= 0 and Grills[Grill] then
        DeleteObject(Grill)
        Grills[Grill] = nil
        TriggerServerEvent("grilling:server:DismantleGrill")
    end
end)

RegisterNetEvent("grilling:client:CookItem", function(data)
    local animationSet = 'amb@prop_human_bbq@male@idle_a'
    local animations = {
        'idle_a',
        'idle_b',
        'idle_c'
    }
    local Ped = PlayerPedId()
    QBCore.Functions.Progressbar('grilling', 'Grilling 1x '..data.Label, Config.Cookables[data.itemName].cookTime, false, true, { -- Name | Label | Time | useWhileDead | canCancel
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = animationSet,
        anim = animations[math.random(1, 3)],
        flags = 16,
    }, {}, {}, function() -- Play When Done
        ClearPedTasks(Ped)
        TriggerServerEvent("grilling:server:getReward", data.itemName)
    end, function() -- Play When Cancel
        ClearPedTasks(Ped)
    end)
end)

CreateThread(function()
    exports['qb-target']:AddTargetModel(1903501406, {
        options = {
             {
                event = 'grilling:client:DismantleGrill',
                type = 'client',
                icon = "fa-solid fa-grill",
                label = "Dismantle Grill",
            },
            {
                event = 'grilling:client:AccessGrill',
                type = 'client',
                icon = "fa-solid fa-grill",
                label = "Open Menu",
            },
           
        },
        distance = 1.5,
    })
end)

