local direction = require("__flib__.direction")

local constants = require("scripts.constants")

local loader_snapping = {}

--- Checks to see if the loader was placed backwards against a container
--- @param entity LuaEntity
function loader_snapping.snap_to_container(entity)
  for i = 1, 2 do
    local container = entity.loader_container
    if container and i == 2 then
      entity.loader_type = "input"
    elseif not container then
      -- Cannot use rotate() because it changes the loader type instead of the direction
      entity.direction = direction.opposite(entity.direction)
      entity.update_connections()
    end
  end
  loader_snapping.snap_direction(entity)
end

--- Snaps the loader to the transport-belt-connectable entity that it's facing
--- If `target` is supplied, it will check against that entity, and will not snap if it cannot connect to it
--- @param entity LuaEntity
--- @param target? LuaEntity
function loader_snapping.snap_direction(entity, target)
  if not entity or not entity.valid then
    return
  end

  -- Check for a connected belt, then flip and try again, then flip back if failed
  for _ = 1, 2 do
    local loader_type = entity.loader_type

    local connection = entity.belt_neighbours[loader_type .. "s"][1]
    if connection and (not target or connection.unit_number == target.unit_number) then
      break
    else
      -- Flip the direction
      entity.rotate()
    end
  end
end

--- Checks for any K2 loaders around the belt entity, then snaps any it finds
--- @param entity LuaEntity
function loader_snapping.snap_belt_neighbours(entity)
  local loaders = {}

  for _ = 1, entity.type == "transport-belt" and 4 or 2 do
    for _, neighbours in pairs(entity.belt_neighbours) do
      for _, neighbour in ipairs(neighbours) do
        if constants.loader_names[neighbour.name] then
          table.insert(loaders, neighbour)
        end
      end
    end
    entity.rotate()
  end

  for _, loader in pairs(loaders) do
    loader_snapping.snap_direction(loader, entity)
  end
end

return loader_snapping
