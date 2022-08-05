-- -- -- -- -- -- -- -- -- -- -- -- -- --
-- components/path_following_position  --
-- -- -- -- -- -- -- -- -- -- -- -- -- --

function new_path_following_position(params)
    local path_points = params.path.points()

    -- TODO: make sure enemy is invisible first and enters the screen on the first possible update
    local frames_per_point = u.fps / 10
    local frame_counter = 1
    local point_index = 1

    local self = {}

    function self.follow()
        -- TODO: refactor, use smarter solution for incrementing table index every N frames
        if frame_counter == 0 then
            if point_index < #path_points then
                point_index = point_index + 1
            end
            frame_counter = frame_counter + 1
        else
            frame_counter = (frame_counter + 1) % frames_per_point
        end
        self.x = path_points[point_index].x
        self.y = path_points[point_index].y
    end

    return self
end