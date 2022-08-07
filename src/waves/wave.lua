-- -- -- -- -- --
-- waves/wave  --
-- -- -- -- -- --

function new_wave(params)
    local enemies = u.required(params.enemies)

    local timer = new_timer {
        start = u.fps * 6,
        -- TODO: various waves
        key_moments = {
            [u.fps * 6] = "enemy",
            [u.fps * 5] = "enemy",
            [u.fps * 4] = "enemy",
            [u.fps * 3] = "enemy",
            [u.fps * 2] = "enemy",
            [u.fps * 1] = "enemy",
            [0] = "enemy",
        },
        on_key_moment = function(type)
            if type == "enemy" then
                enemies.spawn()
            end
        end,
    }

    local self = {}

    --

    function self.wave_number()
        -- TODO: implement multiple waves of incrementing numbers
        return 1
    end

    --

    function self.progress()
        return timer.progress()
    end

    --

    function self.update()
        timer.update()
    end

    --

    return self
end