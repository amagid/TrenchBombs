--Helper Functions for use throughout Mod

--Get coordinates from Entity and convert them to <x>-<y> string format
function getEntityCoords(entity)
    return entity.position.x .. "-" .. entity.position.y
end