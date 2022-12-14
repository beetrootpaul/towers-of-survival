function new_placement(params)
    local chosen_tower = u.r(params.tower_choice).chosen_tower()
    local warzone = u.r(params.warzone)
    local other_towers = u.r(params.other_towers)
    local money = u.r(params.money)

    local chosen_tile = new_tile(4, 5)

    local chosen_tile_border = new_chosen_tile_border {
        tile = chosen_tile,
    }

    local function new_tower_range()
        if chosen_tower.type == "laser" then
            return new_tower_range_laser {
                tile = chosen_tile,
            }
        elseif chosen_tower.type == "v_beam" then
            return new_tower_range_v_beam {
                tile = chosen_tile,
            }
        elseif chosen_tower.type == "booster" then
            return new_tower_range_booster {
                tile = chosen_tile,
                warzone = warzone,
            }
        else
            assert(false, "unexpected tower type: " .. chosen_tower.type)
        end
    end

    local tower_range = new_tower_range()

    local function check_if_can_build()
        local result = {
            can_build = true,
            colliding_towers = {},
        }
        if money.available < chosen_tower.cost then
            result.can_build = false
        end
        local colliding_towers = other_towers.find_colliding_towers(chosen_tower.type, chosen_tile)
        if #colliding_towers > 0 then
            result.can_build = false
            result.colliding_towers = colliding_towers
        end
        if not warzone.can_have_tower_at(chosen_tile) then
            result.can_build = false
        end
        return result
    end

    local s = {}

    function s.chosen_tile()
        return chosen_tile
    end

    function s.can_build()
        return check_if_can_build().can_build
    end

    function s.move_chosen_tile(direction)
        chosen_tile = chosen_tile.plus(direction.x, direction.y)
        chosen_tile = new_tile(
            mid(0, chosen_tile.x, a.warzone_size_tiles - 1),
            mid(0, chosen_tile.y, a.warzone_size_tiles - 1)
        )

        tower_range = new_tower_range()

        chosen_tile_border = new_chosen_tile_border {
            tile = chosen_tile,
        }
    end

    function s.draw()
        local sprite = chosen_tower.sprite

        -- TODO: draw dimmed sprite if cannot build
        sspr(sprite.x, sprite.y, u.ts, u.ts, (a.wbt + chosen_tile.x) * u.ts, (a.wbt + chosen_tile.y) * u.ts)

        -- TODO: draw dimmed range if cannot build
        tower_range.draw(a.colors.white, a.colors.grey_dark)

        local can_build_check_result = check_if_can_build()

        for tower in all(can_build_check_result.colliding_towers) do
            fillp(0xa5a5 + .5)
            rectfill(tower.x, tower.y, tower.x + u.ts - 1, tower.y + u.ts - 1, a.colors.red_light)
            fillp()
        end

        chosen_tile_border.draw(can_build_check_result.can_build)
    end

    return s
end