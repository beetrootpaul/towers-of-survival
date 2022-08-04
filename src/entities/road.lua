-- -- -- -- -- -- --
-- entities/road  --
-- -- -- -- -- -- --

function new_road()

    local serialized_tiles = {
        "-2|3",
        "-1|3",
        "0|3",
        "1|3",
        "1|4",
        "1|5",
        "1|6",
        "1|7",
        "2|7",
        "3|7",
        "3|8",
        "3|9",
        "3|10",
        "4|10",
        "5|10",
        "6|10",
        "7|10",
        "7|9",
        "7|8",
        "7|7",
        "7|6",
        "6|6",
        "6|5",
        "6|4",
        "6|3",
        "6|2",
        "6|1",
        "7|1",
        "8|1",
        "9|1",
        "10|1",
        "11|1",
        "11|2",
        "11|3",
        "11|4",
        "11|5",
        "12|5",
        "13|5",
    }

    local tilemap = new_tilemap {
        within_warzone_only = false,
        get_tile_at = function(tile_x, tile_y)
            local tt = {}
            for st in all(serialized_tiles) do
                tt[st] = true
            end
            if tt[tile_x .. "|" .. tile_y] then
                return a.tiles.road
            end
            if tt[tile_x .. "|" .. (tile_y - 1)] then
                return a.tiles.road_edge_bottom
            end
            return nil
        end,
    }

    local path = new_path {
        waypoints = (function()
            local ww = {}
            for i = 1, #serialized_tiles do
                local tile_x = tonum(split(serialized_tiles[i], '|')[1])
                local tile_y = tonum(split(serialized_tiles[i], '|')[2])
                if i == 1 then
                    tile_x = tile_x - 1
                elseif i == #serialized_tiles then
                    tile_x = tile_x + 1
                end
                add(ww, {
                    x = (a.warzone_border_tiles + tile_x) * u.tile_size,
                    y = (a.warzone_border_tiles + tile_y) * u.tile_size,
                })
            end
            return ww
        end)(),
    }

    return {
        tilemap = tilemap,
        path = path,
    }
end