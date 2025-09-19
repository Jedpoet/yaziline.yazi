---@diagnostic disable: undefined-global

local function setup(_, options)
    -- Test 2: Overwriting mode (which we know is safe) and size.

    function Status:mode()
        return ui.Line({})
    end

    -- Adding this function back. If it crashes now, this is the culprit.
    function Status:size()
        local h = self._current.hovered
        local size = 0
        if h then
            size = h:size() or (h.cha and h.cha.len) or 0
        end

        -- Return a minimal but valid UI element for the test.
        return ui.Line({ ui.Span(tostring(size)) })
    end
end

return { setup = setup }
