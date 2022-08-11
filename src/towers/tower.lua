function new_tower(params)
    local tower_descriptor = u.r(params.tower_descriptor)
    local tile = u.r(params.tile)
    local enemies = u.r(params.enemies)
    local fight = u.r(params.fight)

    local range
    if tower_descriptor.type == "laser" then
        range = new_tower_range_laser {
            tile = tile,
        }
    elseif tower_descriptor.type == "v_beam" then
        range = new_tower_range_v_beam {
            tile = tile,
        }
    end

    local function new_shooting_timer()
        return new_timer {
            start = u.fps * tower_descriptor.shooting_time,
        }
    end

    local function new_charging_timer()
        return new_timer {
            start = u.fps * tower_descriptor.charging_time,
        }
    end

    local charging_timer = new_charging_timer()
    local shooting_timer

    local s = {
        type = tower_descriptor.type,
        x = (a.warzone_border_tiles + tile.x) * u.ts,
        y = (a.warzone_border_tiles + tile.y) * u.ts,
    }

    --

    function s.is_at(tile_to_check)
        return tile_to_check.is_same_as(tile)
    end

    function s.update()
        if charging_timer and charging_timer.has_finished() then
            charging_timer = nil
        elseif shooting_timer and shooting_timer.has_finished() then
            shooting_timer = nil
            charging_timer = new_charging_timer()
        end

        if not charging_timer then
            local is_attacking = false

            -- TODO: support more tower types
            if s.type == "laser" then
                enemies.for_each_from_furthest(function(enemy)
                    if not is_attacking and range.touches_enemy(enemy) then
                        is_attacking = true
                        -- TODO: SFX
                        -- TODO: VFX tower
                        -- TODO: VFX enemy
                        enemy.take_damage(tower_descriptor.dps / u.fps)
                        fight.show_laser {
                            source_xy = range.laser_source_xy(),
                            target_xy = enemy.center_xy(),
                        }
                    end
                end)
            elseif s.type == "v_beam" then
                enemies.for_each_from_furthest(function(enemy)
                    if range.touches_enemy(enemy) then
                        is_attacking = true
                        -- TODO: SFX
                        -- TODO: VFX tower
                        -- TODO: VFX enemy
                        enemy.take_damage(tower_descriptor.dps / u.fps)
                    end
                end)
                if is_attacking then
                    fight.show_beam {
                        tile_x = tile.x,
                    }
                end
            end

            if is_attacking and not shooting_timer then
                shooting_timer = new_shooting_timer()
            end
        end

        if charging_timer then
            charging_timer.update()
        end
        if shooting_timer then
            shooting_timer.update()
        end
    end

    -- TODO: v-beam's "rails"
    function s.draw()
        local sprite = u.r(a.tiles["tower_" .. s.type])
        sspr(sprite.x, sprite.y, u.ts, u.ts, s.x, s.y)

        if d.enabled then
            range.draw(a.colors.blue_dark)
        end
    end

    --

    return s
end