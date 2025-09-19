---@diagnostic disable: undefined-global

local function setup(_, options)
    -- This is a minimal reproducible example.
    -- It only overwrites one of Yazi's built-in status functions.
    -- If this still crashes on Windows, it proves the issue is
    -- the act of monkey-patching itself.
    function Status:mode()
        return ui.Line({})
    end
end

return { setup = setup }