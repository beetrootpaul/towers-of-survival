-- TODO: screen polish
function new_screen_title()
    local timer = new_timer {
        start = 3 * u.fps,
    }

    local s = {}

    function s.update()
        local next_screen = s

        if timer.has_finished() then
            next_screen = new_screen_pre_gameplay()
        end

        timer.update()

        return next_screen
    end

    function s.draw()
        local clip_progress = max(0, 6 * timer.progress() - 5)
        local clip_y = flr(clip_progress * (u.vs - 2 * a.wb) / 2)
        clip(0, a.wb + clip_y, u.vs, u.vs - 2 * a.wb - 2 * clip_y)

        print("todo: game title", 0, u.vs / 2 - 8, a.colors.white)
        print("by beetroot paul", 0, u.vs / 2 + 8, a.colors.white)

        clip()
    end

    return s
end