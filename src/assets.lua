a = {
    button_sprites = {
        -- format: { x, y, w, h }
        x = {
            raised = { 115, 32, 5, 6 },
            pressed = { 115, 40, 5, 6 },
        },
        o = {
            raised = { 109, 32, 5, 6 },
            pressed = { 109, 40, 5, 6 },
        },
    },
    colors = {
        brown_dark = 0,
        blue_dark = 1,
        red_dark = 2,
        brown_mid = 3,
        --
        brown_light = 4,
        grey_dark = 5,
        grey_light = 6,
        white = 7,
        --
        red_light = 8,
        salmon = 9,
        yellow = 10,
        green = 11,
        --
        blue_light = 12,
        grey_violet = 13,
        brown_purple = 14,
        sand = 15,
    },
    cores = {
        sprites = {
            -- format: { x, y, width, height }
            healthy_1 = { 120, 0, 8, 8 },
            healthy_2 = { 120, 8, 8, 8 },
            healthy_3 = { 120, 8, 8, 8 },
            healthy_4 = { 120, 16, 8, 8 },
            healthy_5 = { 120, 24, 8, 8 },
            broken_1 = { 112, 0, 8, 8 },
            broken_2 = { 112, 8, 8, 8 },
            broken_3 = { 112, 8, 8, 8 },
            broken_4 = { 112, 16, 8, 8 },
            broken_5 = { 112, 24, 8, 8 },
        }
    },
    enemies = {
        small = {
            hitbox_r = 1,
            health = 20,
            -- format: {x, y, w, h, offset_x, offset_y, hitbox_offset_x, hitbox_offset_y }
            sprite_right = { 16, 0, 3, 3, 0, 0, 1, 1 },
            sprite_left = { 16, 0, 3, 3, 0, 0, 1, 1 },
            sprite_up = { 20, 0, 2, 4, 1, -1, 1, 0 },
            sprite_down = { 20, 0, 2, 4, 1, -1, 1, 0 },
            -- format: {x, y, w, h, offset_x, offset_y }
            sprite_damage_right = { 16, 4, 3, 3, 0, 0 },
            sprite_damage_left = { 16, 4, 3, 3, 0, 0 },
            sprite_damage_up = { 20, 4, 2, 4, 1, -1 },
            sprite_damage_down = { 20, 4, 2, 4, 1, -1 },
        },
        medium = {
            hitbox_r = 1.5,
            health = 65,
            -- format: {x, y, w, h, offset_x, offset_y, hitbox_offset_x, hitbox_offset_y }
            sprite_right = { 24, 0, 4, 5, 0, -1, 1.5, .5 },
            sprite_left = { 24, 0, 4, 5, 0, -1, 1.5, .5 },
            sprite_up = { 24, 0, 4, 5, 0, -1, 1.5, .5 },
            sprite_down = { 24, 0, 4, 5, 0, -1, 1.5, .5 },
            -- format: {x, y, w, h, offset_x, offset_y }
            sprite_damage_right = { 28, 0, 4, 5, 0, -1 },
            sprite_damage_left = { 28, 0, 4, 5, 0, -1 },
            sprite_damage_up = { 28, 0, 4, 5, 0, -1 },
            sprite_damage_down = { 28, 0, 4, 5, 0, -1 },
        },
        big = {
            hitbox_r = 2,
            health = 130,
            -- format: {x, y, w, h, offset_x, offset_y, hitbox_offset_x, hitbox_offset_y }
            sprite_right = { 16, 9, 5, 5, -1, -1, 1.5, .5 },
            sprite_left = { 22, 9, 5, 5, -1, -1, 1.5, .5 },
            sprite_up = { 28, 8, 4, 6, 0, -1, 1.5, 1.5 },
            sprite_down = { 33, 9, 4, 6, 0, -1, 1.5, .5 },
            -- format: {x, y, w, h, offset_x, offset_y }
            sprite_damage_right = { 16, 15, 5, 5, -1, -1 },
            sprite_damage_left = { 22, 15, 5, 5, -1, -1 },
            sprite_damage_up = { 28, 14, 4, 6, 0, -1 },
            sprite_damage_down = { 33, 15, 4, 6, 0, -1 },
        },
    },
    enemy_speed = 10,
    font_sprites = {
        -- format: { x, y, width = 3 }
        ["a"] = { 0, 32 },
        ["b"] = { 4, 32 },
        ["c"] = { 8, 32 },
        ["d"] = { 12, 32 },
        ["e"] = { 16, 32 },
        ["f"] = { 20, 32 },
        ["g"] = { 24, 32 },
        ["h"] = { 28, 32 },
        ["i"] = { 32, 32, 1 },
        ["j"] = { 34, 32, 2 },
        ["k"] = { 37, 32 },
        ["l"] = { 41, 32, 2 },
        ["m"] = { 44, 32 },
        ["n"] = { 48, 32 },
        ["o"] = { 52, 32 },
        ["p"] = { 56, 32 },
        ["q"] = { 60, 32 },
        ["r"] = { 64, 32 },
        ["s"] = { 68, 32 },
        ["t"] = { 72, 32 },
        ["u"] = { 76, 32 },
        ["v"] = { 80, 32 },
        ["w"] = { 84, 32 },
        ["x"] = { 88, 32 },
        ["y"] = { 92, 32 },
        ["z"] = { 96, 32 },
        ["-"] = { 100, 32, 2 },
        ["."] = { 103, 32, 1 },
        [" "] = { 126, 32, 2 },
        ["1"] = { 0, 40, 2 },
        ["2"] = { 3, 40 },
        ["3"] = { 7, 40 },
        ["4"] = { 11, 40 },
        ["5"] = { 15, 40 },
        ["6"] = { 19, 40 },
        ["7"] = { 23, 40 },
        ["8"] = { 27, 40 },
        ["9"] = { 31, 40 },
        ["0"] = { 35, 40 },
        -- star:
        ["*"] = { 39, 40, 5 },
        -- skull:
        ["@"] = { 45, 40, 5 },
        -- abstract currency symbol:
        ["$"] = { 105, 32 },
        -- back arrow:
        ["<"] = { 121, 32, 4 },
    },
    lives_max = 5,
    money_increase_seconds = 0.5,
    money_initial = 40,
    sfx = {
        live_lost = { priority = 6, track = 21 },
        cannot_place = { priority = 5, track = 18 },
        tower_placed = { priority = 4, track = 19 },
        button_press = { priority = 3, track = 20 },
        v_beam = { priority = 2, track = 17 },
        laser = { priority = 1, track = 16 },
    },
    tiles = {
        ground_textured = { x = 0, y = 8 },
        ground_plain = { x = 4, y = 8 },
        road = { x = 0, y = 24 },
        road_edge_bottom = { x = 0, y = 28 },
        road_edge_top = { x = 0, y = 20 },
        road_edge_right = { x = 4, y = 24 },
        road_edge_left = { x = 4, y = 28 },
    },
    towers = {
        laser = {
            label = "laser",
            cost = 20,
            sprite = { x = 48, y = 0 },
            dps = 20,
            charging_time = .9,
            shooting_time = .1,
            charging_time_boost = -.1,
            shooting_time_boost = .1,
        },
        booster = {
            label = "booster",
            cost = 30,
            sprite = { x = 48, y = 8 },
        },
        v_beam = {
            label = "v-beam",
            cost = 70,
            sprite = { x = 48, y = 16 },
            dps = 40,
            charging_time = 2,
            shooting_time = .5,
            charging_time_boost = -.2,
            shooting_time_boost = .1,
        },
    },
    warzone_size_tiles = 12,
    -- warzone border
    wb = 8,
    -- warzone border tiles
    wbt = 2,
    waves = {
        -- TODO: fix edge case of 1-long wave: progress drawn wrong, wave never ends
        { wait = 4, spawns = "s,-,-,s,-,-,s" },
        { wait = 2, spawns = "s,s,-,s,s,-,s,s" },
        { wait = 4, spawns = "m,-,-,s,s,s,-,-,m" },
        { wait = 4, spawns = "s,s,s,-,-,m,m,-,-,-,s,-,-,b" },
        { wait = 6, spawns = "s,m,b,-,-,-,s,b,-,-,m,m" },
        { wait = 2, spawns = "m,m,-,-,b,b,b" },
        { wait = 4, spawns = "s,s,-,m,m,-,b,b" },
        { wait = 4, spawns = "b,-,s,-,m,-,s,-,b" },
        { wait = 2, spawns = "m,-,-,-,m,m,m,m,m,m" },
        { wait = 8, spawns = "s,m,m,b,b,b,-,-,-,-,b,b,b,m,m,s" },
    },
}

a.button_template_color_1 = a.colors.green
a.button_template_color_2 = a.colors.red_light

a.font_template_color = a.colors.green

-- Made with Palette-Maker (https://www.lexaloffle.com/bbs/?tid=35462)
a.palette = {
    [a.colors.brown_dark] = 128,
    [a.colors.blue_dark] = 140,
    [a.colors.red_dark] = 136,
    [a.colors.brown_mid] = 133,
    --
    [a.colors.brown_light] = 4,
    [a.colors.grey_dark] = 5,
    [a.colors.grey_light] = 6,
    [a.colors.white] = 7,
    --
    [a.colors.red_light] = 8,
    [a.colors.salmon] = 142,
    [a.colors.yellow] = 135,
    [a.colors.green] = 139,
    --
    [a.colors.blue_light] = 12,
    [a.colors.grey_violet] = 13,
    [a.colors.brown_purple] = 141,
    [a.colors.sand] = 134,
}
