--All functional Mod code

require "util"
require("config.constants")
require("helpers")

TB_DETONATION_EVENT = script.generate_event_name()

script.on_init(function()
    global.tbdata = TB_DEFAULT_PUBLIC_DATA
end)

script.on_event(defines.events.on_tick, function()
    if #global.tbdata.detonationsInProgress ~= 0 then
        if global.tbdata.counter <= 0 then
            script.raise_event(TB_DETONATION_EVENT, global.tbdata.detonationsInProgress)
            global.tbdata.counter = TB_DETONATION_DELAY
        else
            global.tbdata.counter = global.tbdata.counter - 1
        end
    end
end)

script.on_event(TB_DETONATION_EVENT, function(detonationsInProgress)
    for k, v in pairs(detonationsInProgress) do
        if type(k) == "number" and type(v) == "table" then
            detonateCurrentStage(v)
        end
    end
end)

script.on_event(defines.events.on_player_created, function(event)
	if not global.tbdata then
		global.tbdata = TB_DEFAULT_PUBLIC_DATA
	end

	local player = game.players[event.player_index]

	global.tbdata[event.player_index] = TB_DEFAULT_PRIVATE_DATA
end)

script.on_event(defines.events.on_built_entity, function(event)
    if event.created_entity.name == TB_NAME then
        event.created_entity.operable = false
    end
    --Only do things if the created entity is a Detonation Coordinator
	if event.created_entity.name == TB_DETONATION_COORDINATOR_NAME then
        event.created_entity.operable = false
        --Store dc in this player's list
        global.tbdata[event.player_index].dcs[getEntityCoords(event.created_entity)] = event.created_entity
	end
end)

script.on_event(defines.events.on_player_mined_entity, function(event)
    --Only do things if the created entity is a Detonation Coordinator
	if event.entity.name == TB_DETONATION_COORDINATOR_NAME then
        --Store dc in this player's list
        global.tbdata[event.player_index].dcs[getEntityCoords(event.entity)] = nil
	end
end)

script.on_event(defines.events.on_trigger_created_entity, function(event)
    if event.entity.name == TB_NAME then
        local player = event.entity.last_user

        event.entity.destroy()

        for k,v in pairs(global.tbdata[player.index].dcs) do
            if not v.valid then
                global.tbdata[player.index].dcs[getEntityCoords(v)] = nil
            elseif v.energy == v.electric_buffer_size then -- Skip if not fully charged
                global.tbdata[player.index].detonation.surface = v.surface
                getAdjacentBombs(v, player.index)
                v.force = "enemy"
                global.tbdata[player.index].dcs[getEntityCoords(v)] = nil
                v.die()
            end
        end

        advanceDetonationStage(player.index)
        global.tbdata.detonationsInProgress[player.index] = player
    end
end)

function getAdjacentBombs(entity, playerIndex)
        local adjacentBombs = entity.surface.find_entities_filtered({area = {{entity.position.x - 1, entity.position.y - 1}, {entity.position.x + 1, entity.position.y + 1}}, name = TB_NAME})
        for _, bomb in pairs(adjacentBombs) do
            if bomb.name == TB_NAME then
                table.insert(global.tbdata[playerIndex].detonation.nextStage, bomb)
            end                
        end
end

function advanceDetonationStage(playerIndex)
    global.tbdata[playerIndex].detonation.currentStage = global.tbdata[playerIndex].detonation.nextStage
    global.tbdata[playerIndex].detonation.nextStage = {} 
end

function detonateCurrentStage(player)
    for _, bomb in pairs(global.tbdata[player.index].detonation.currentStage) do
        if bomb.valid then
            getAdjacentBombs(bomb, player.index)
            detonate(bomb)
        end
    end

    advanceDetonationStage(player.index)
    if global.tbdata[player.index].detonation.currentStage[1] == nil then
        global.tbdata.detonationsInProgress[player.index] = nil
    end
end

function detonate(bomb)
    local position = bomb.position
    local surface = bomb.surface
    --for each tile 2 direct spaces away, if it's water, include the tile in between that and the bomb in the detonation
    local tiles = findNearbyWater(surface, position.x, position.y)
    table.insert(tiles, {name = "water", position = position})
    --So that you don't get a warning when it's destroyed
    bomb.force = "enemy"
    --Detonate bomb
    bomb.die()
    killEntities(surface, tiles)
    surface.set_tiles(tiles)
end

function findNearbyWater(surface, x, y)
    local tiles = {}
    local k, i, j
    local coords = {{-1, 0}, {0, -1}, {1, 0}, {0, 1}}

    for k = 1, 4, 1 do
        if coords[k] ~= nil then
            i = 2 * coords[k][1]
            j = 2 * coords[k][2]
            if surface.get_tile(x + i, y + j).name == "water" then
                table.insert(tiles, {name = "water", position = {x = x + (i / 2), y = y + (j / 2)}})
                coords[k] = nil
            end
        end
    end

    for k = 1, 4, 1 do
        if coords[k] ~= nil then
            i = 3 * coords[k][1]
            j = 3 * coords[k][2]
            if surface.get_tile(x + i, y + j).name == "water" then
                table.insert(tiles, {name = "water", position = {x = x + (i / 3), y = y + (j / 3)}})
                table.insert(tiles, {name = "water", position = {x = x + 2 * (i / 3), y = y + 2 * (j / 3)}})
                coords[k] = nil
            end
        end
    end

    for k = 1, 4, 1 do
        if coords[k] ~= nil then
            i = 4 * coords[k][1]
            j = 4 * coords[k][2]
            if surface.get_tile(x + i, y + j).name == "water" then
                table.insert(tiles, {name = "water", position = {x = x + (i / 4), y = y + (j / 4)}})
                table.insert(tiles, {name = "water", position = {x = x + 2 * (i / 4), y = y + 2 * (j / 4)}})
                table.insert(tiles, {name = "water", position = {x = x + 3 * (i / 4), y = y + 3 * (j / 4)}})
                coords[k] = nil
            end
        end
    end

    return tiles
end

-- Kill all of the entities on the listed tiles before changing them to water
function killEntities(surface, tiles)
    local entity
    for _, v in pairs(tiles) do
        entity = surface.find_entities({{v.position.x - 0.001, v.position.y - 0.001}, {v.position.x + 0.001, v.position.y + 0.001}})
        for _, e in pairs(entity) do
            if e.valid and e.health ~= nil and e.destructible and (e.has_flag("placeable-player") or e.has_flag("placeable-neutral") or e.has_flag("placeable-enemy")) then
                e.die()
            end
        end
    end
end