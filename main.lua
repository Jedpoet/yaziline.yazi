---@diagnostic disable: undefined-global

local function setup(_, options)
    -- Test 3: Adding Status:modified to the set of safe functions.

    function Status:mode()
        return ui.Line({})
    end

    function Status:size()
        local h = self._current.hovered
        local size = 0
        if h then
            size = h:size() or (h.cha and h.cha.len) or 0
        end
        return ui.Line({ ui.Span(tostring(size)) })
    end

    -- Adding this function back. If it crashes now, this is the culprit.
    function Status:modified()
        local hovered = cx.active.current.hovered
        if not hovered or not hovered.cha then
            return ui.Line({})
        end
        local time = math.floor((hovered.cha.mtime or 0) / 1)
        return ui.Line({ ui.Span(os.date("%Y-%m-%d %H:%M", time) or "") })
    end
end

return { setup = setup }