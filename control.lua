--All functional Mod code

require "util"
require("config.constants")
require("helpers")

script.on_init(function()
    global.tbdata = {}
end)

script.on_event(defines.events.on_player_created, function(event)
	if not global.tbdata then
		global.tbdata = {}
	end

	local player = game.players[event.player_index]

	global.tbdata[event.player_index] = TB_DEFAULT_PRIVATE_DATA
end)

script.on_event(defines.events.on_built_entity, function(event)
    if event.created_entity.name == TB_NAME then
        event.created_entity.force = "enemy"
    end
    --Only do things if the created entity is a Detonation Coordinator
	if event.created_entity.name == TB_DETONATION_COORDINATOR_NAME then
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
    event.entity.last_user.print("Triggered")
    local player = event.entity.last_user
    event.entity.destroy()

    for k,v in pairs(global.tbdata[player.index].dcs) do
        player.print("Triggering DC at: " .. getEntityCoords(v))
        global.tbdata[player.index].detonation.surface = v.surface
        getAdjacentBombs(v, player.index)
    end

    advanceDetonationStage(player.index)
    detonateCurrentStage(player)
end)

function getAdjacentBombs(entity, playerIndex)
        game.players[1].print("getting adjacent bombs")
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
        game.players[1].print(#adjacentBombs .. " adjacent bombs found")
        for _, bomb in pairs(adjacentBombs) do
            game.players[1].print("Found: " .. bomb.name)
            if bomb.name == TB_NAME then
                game.players[1].print("Adding bomb to nextStage")
                table.insert(global.tbdata[playerIndex].detonation.nextStage, bomb)
            else
                game.players[1].print("Non-Bomb entity found")
            end                
        end
end

function advanceDetonationStage(playerIndex)
    global.tbdata[playerIndex].detonation.currentStage = global.tbdata[playerIndex].detonation.nextStage
    global.tbdata[playerIndex].detonation.nextStage = {} 
end

function detonateCurrentStage(player)
    game.players[1].print("detonating current stage")
    for _, bomb in pairs(global.tbdata[player.index].detonation.currentStage) do
        game.players[1].print("Checking a bomb")
        if bomb.valid then
            game.players[1].print("bomb valid")
            getAdjacentBombs(bomb, player.index)
            detonate(bomb)
        else
            player.print("Invalid Bomb Reached")
        end
    end

    game.players[1].print("done detonating bombs for this stage")
    advanceDetonationStage(player.index)
    game.players[1].print("stage advanced")
    if global.tbdata[player.index].detonation.currentStage[1] ~= nil then
        game.players[1].print("detonating next stage")
        detonateCurrentStage(player)
    end
end

function detonate(bomb)
    game.players[1].print("Detonating")
    --local lamp = global.tbdata[playerIndex].detonation.surface.create_entity({name = TB_EXPLOSION_NAME, position = bomb.position})
    --game.players[1].print("Created " .. lamp.name .. " at " .. getEntityCoords(bomb))
    --lamp.die()
    --game.players[1].print("Lamp Destroyed")
    --global.tbdata[playerIndex].detonation.surface.create_entity({name = "water", position = bomb.position})
    bomb.die()
end