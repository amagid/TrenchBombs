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
            -- game.players[1].print("k: " .. k)
            -- game.players[1].print(" v.index: " .. v.index)
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
    --event.entity.last_user.print("Triggered")
    local player = event.entity.last_user

    event.entity.destroy()

    for k,v in pairs(global.tbdata[player.index].dcs) do
        -- player.print("Triggering DC at: " .. getEntityCoords(v))
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
    -- game.players[1].print("adding player to list: #" .. player.index)
end)

function getAdjacentBombs(entity, playerIndex)
        -- game.players[1].print("getting adjacent bombs")
        local adjacentBombs = entity.surface.find_entities_filtered({area = {{entity.position.x - 1, entity.position.y - 1}, {entity.position.x + 1, entity.position.y + 1}}, name = TB_NAME})
--        local adjacentBombs = entity.surface.find_entities({{entity.position.x - 1, entity.position.y - 1}, {entity.position.x + 1, entity.position.y + 1}})
--[[        local adjacentBombs = {}
        local x, y
        for x = -1, 1, 1 do
            for y = -1, 1, 1 do
                table.insert(adjacentBombs, global.tbdata[playerIndex].detonation.surface.get_tile(entity.position.x + x, entity.position.y + y))
            end
        end
        --]]
        -- game.players[1].print(#adjacentBombs .. " adjacent bombs found")
        for _, bomb in pairs(adjacentBombs) do
            -- game.players[1].print("Found: " .. bomb.name)
            if bomb.name == TB_NAME then
                -- game.players[1].print("Adding bomb to nextStage")
                table.insert(global.tbdata[playerIndex].detonation.nextStage, bomb)
            else
                -- game.players[1].print("Non-Bomb entity found")
            end                
        end
end

function advanceDetonationStage(playerIndex)
    global.tbdata[playerIndex].detonation.currentStage = global.tbdata[playerIndex].detonation.nextStage
    global.tbdata[playerIndex].detonation.nextStage = {} 
end

function detonateCurrentStage(player)
    -- game.players[1].print("detonating current stage")
    for _, bomb in pairs(global.tbdata[player.index].detonation.currentStage) do
        -- game.players[1].print("Checking a bomb")
        if bomb.valid then
            -- game.players[1].print("bomb valid")
            getAdjacentBombs(bomb, player.index)
            detonate(bomb)
        else
            -- player.print("Invalid Bomb Reached")
        end
    end

    -- game.players[1].print("done detonating bombs for this stage")
    advanceDetonationStage(player.index)
    -- game.players[1].print("stage advanced")
    if global.tbdata[player.index].detonation.currentStage[1] == nil then
        -- game.players[1].print("Detonation Finished")
        global.tbdata.detonationsInProgress[player.index] = nil
    end
end

function detonate(bomb)
    -- game.players[1].print("Detonating")
    --local lamp = global.tbdata[playerIndex].detonation.surface.create_entity({name = TB_EXPLOSION_NAME, position = bomb.position})
    ---- game.players[1].print("Created " .. lamp.name .. " at " .. getEntityCoords(bomb))
    --lamp.die()
    ---- game.players[1].print("Lamp Destroyed")
    --global.tbdata[playerIndex].detonation.surface.create_entity({name = "water", position = bomb.position})
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
    local i, j

    for i = -2, 2, 2 do
        for j = -2, 2, 2 do
            if surface.get_tile(x + i, y + j).name == "water" then
                table.insert(tiles, {name = "water", position = {x = x + (i / 2), y = y + (j / 2)}})
--                game.players[1].print("Found water at position (x + " .. i .. ", y + " .. j .. ")")
            end
        end
    end

    for i = -3, 3, 3 do
        for j = -3, 3, 3 do
            if surface.get_tile(x + i, y + j).name == "water" then
                table.insert(tiles, {name = "water", position = {x = x + (i / 3), y = y + (j / 3)}})
                table.insert(tiles, {name = "water", position = {x = x + (2 * i / 3), y = y + (2 * j / 3)}})
--                game.players[1].print("Found water at position (x + " .. i .. ", y + " .. j .. ")")
            end
        end
    end

    for i = -4, 4, 4 do
        for j = -4, 4, 4 do
            if surface.get_tile(x + i, y + j).name == "water" then
                table.insert(tiles, {name = "water", position = {x = x + (i / 4), y = y + (j / 4)}})
                table.insert(tiles, {name = "water", position = {x = x + (2 * i / 4), y = y + (2 * j / 4)}})
                table.insert(tiles, {name = "water", position = {x = x + (3 * i / 4), y = y + (3 * j / 4)}})
 --               game.players[1].print("Found water at position (x + " .. i .. ", y + " .. j .. ")")
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
            game.players[1].print("Trying to kill entity '" .. e.name .. "' at position (" .. v.position.x .. ", " .. v.position.y .. ")")
            if e.valid and e.health ~= nil and e.destructible and (e.has_flag("placeable-player") or e.has_flag("placeable-neutral") or e.has_flag("placeable-enemy")) then
                game.players[1].print("Killing.")
                e.die()
            end
        end
    end
end