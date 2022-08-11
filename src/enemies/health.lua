function new_health(params)
    local max_value = u.r(params.max_value)

    local s = {
        value = max_value,
    }

    function s.subtract(damage)
        s.value = max(0, s.value - damage)
    end

    return s
end